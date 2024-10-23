# Install the necessary libraries:
# pip install Flask face_recognition

from flask import Flask, request, jsonify
import face_recognition # type: ignore
from flask_cors import CORS
CORS(app)


app = Flask(__name__)

@app.route('/recognize', methods=['POST'])
def recognize_face():
    # Ambil gambar dari request
    file = request.files['image']
    image = face_recognition.load_image_file(file)
    
    # Deteksi wajah di gambar
    face_locations = face_recognition.face_locations(image)
    
    if len(face_locations) > 0:
        return jsonify({'status': 'success', 'message': 'Face detected!'}), 200
    else:
        return jsonify({'status': 'failed', 'message': 'No face detected!'}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
