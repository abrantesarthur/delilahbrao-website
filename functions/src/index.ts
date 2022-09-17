import {https, Response} from "firebase-functions";
import admin = require("firebase-admin");
import cors = require("cors");
import axios from "axios";

admin.initializeApp();

const corsHandler = cors({origin: true});

// TODO: allow requests only from delilahbrao.com
exports.newsletterSubscribe = https.onRequest((req, res: Response) : void => {
  corsHandler(req, res, async () => {
    const email = req.body.email;
    const fname = req.body.first_name;
    const lname = req.body.last_name;

    if (email === undefined) {
      return res.status(400).send("missing 'email' in request body.");
    }
    if (fname === undefined) {
      return res.status(400).send("missing 'first_name' in request body.");
    }
    if (fname === undefined) {
      return res.status(400).send("missing 'last_name' in request body.");
    }


    const server = "us9";
    const listID = process.env.MAILCHIMP_LIST_ID;
    const apiKey = process.env.MAILCHIMP_API_KEY;
    const credentials = Buffer.from(`key:${apiKey}`).toString("base64");

    try {
      await axios.post(
          `https://${server}.api.mailchimp.com/3.0/lists/${listID}/members`,
          {
            "email_address": email,
            "status": "subscribed",
            "merge_fields": {"FNAME": fname, "LNAME": lname},
          },
          {
            headers: {
              "Content-Type": "application/json",
              "Authorization": `Basic ${credentials}`,
            },
          }
      );
      return res.status(200).send("Success adding user to mailchimp");
    } catch (e: unknown) {
      console.log(`Failed to add user to mailchimp newsletter: ${e}`);
      return res.status(400).send(e);
    }
  });
});

