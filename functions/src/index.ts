/* eslint-disable @typescript-eslint/no-var-requires */

import {https, Response} from "firebase-functions";
import admin = require("firebase-admin");
admin.initializeApp();


exports.newsletterSubscribe = https.onRequest((_, res: Response) : void => {
  res.json({result: "Hello world!"});
});

