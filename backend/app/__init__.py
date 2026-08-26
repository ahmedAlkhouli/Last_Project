from flask import Flask, jsonify
from config import Config
from app.db import engine
from app.models import metadata

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Ensure tables are created

    from app.routes_auth import auth_bp
    from app.routes_courses import courses_bp

    app.register_blueprint(auth_bp)
    app.register_blueprint(courses_bp)


    @app.errorhandler(400)
    def bad_request(e):
        return jsonify({"error": "Bad Request", "details": str(e)}), 400

    @app.errorhandler(401)
    def unauthorized(e):
        return jsonify({"error": "Unauthorized"}), 401

    @app.errorhandler(404)
    def not_found(e):
        return jsonify({"error": "Resource Not Found"}), 404

    @app.errorhandler(500)
    def server_error(e):
        return jsonify({"error": "Internal Server Error"}), 500

    return app

app = create_app()
