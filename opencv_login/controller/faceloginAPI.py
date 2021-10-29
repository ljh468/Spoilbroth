# -*- coding:utf-8 -*-
import numpy as np
import base64
from flask import Flask, request
import util.CmmUtil as cu
from service.face_create_image_train import face_train
from service.face_predict import face_predict
import cv2

application = Flask(__name__)

@application.route("/")
def hello():
    return "<h1> 파이썬!! </h1>"

@application.route("/facelearningAPI", methods=['POST', 'GET'])
def faceLearning():

    user_id = cu.CmmUtil.nvl(request.args.get("user_id"))
    print("user_id : " , user_id)
    res = face_train(user_id)

    return res


@application.route("/faceloginAPI", methods=['POST'])
def faceAnalysis():
    contents = request.get_json(force=True,silent=True)
    print(str(contents[0]))
    user_id = str(contents[0])
    print(len(contents))

    ress = face_predict(user_id, contents)

    return ress

if __name__ == "__main__":
    application.run(host="0.0.0.0", port=8000)