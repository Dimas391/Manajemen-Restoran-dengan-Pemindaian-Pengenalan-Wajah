from flask import Flask, jsonify, Response
import cv2

app = Flask(__name__)

# Muat model Haar Cascade untuk deteksi wajah
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

def generate_frames():
    cap = cv2.VideoCapture(0)  # Buka kamera
    if not cap.isOpened():
        yield b'Failed to open camera'
        return

    while True:
        ret, frame = cap.read()  # Baca frame dari kamera
        if not ret:
            break

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)  # Ubah gambar menjadi grayscale
        faces = face_cascade.detectMultiScale(gray, 1.3, 5)  # Deteksi wajah

        # Gambar kotak di sekitar wajah yang terdeteksi
        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)

        # Ubah frame menjadi JPEG
        _, buffer = cv2.imencode('.jpg', frame)
        frame_bytes = buffer.tobytes()

        # Kirim frame sebagai response
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame_bytes + b'\r\n')

    cap.release()  # Lepaskan kamera

@app.route('/video_feed')
def video_feed():
    return Response(generate_frames(), mimetype='multipart/x-mixed-replace; boundary=frame')

@app.route('/scan', methods=['GET'])
def scan_face():
    cap = cv2.VideoCapture(0)

    ret, frame = cap.read()  # Baca satu frame dari kamera
    if not ret:
        cap.release()
        return jsonify({'error': 'Failed to capture image'})

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)  # Ubah gambar menjadi grayscale
    faces = face_cascade.detectMultiScale(gray, 1.3, 5)  # Deteksi wajah

    # Gambar kotak di sekitar wajah yang terdeteksi
    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x + w, y + h), (255, 0, 0), 2)

    # Ubah frame menjadi JPEG
    _, buffer = cv2.imencode('.jpg', frame)
    frame_bytes = buffer.tobytes()

    cap.release()  # Lepaskan kamera

    # Kirim gambar hasil deteksi sebagai response
    return Response(frame_bytes, mimetype='image/jpeg')

if __name__ == '__main__':
    app.run(debug=True)
