import {https, Response} from "firebase-functions";
import admin = require("firebase-admin");
import mailchimp = require("@mailchimp/mailchimp_marketing");
import cors = require("cors");

admin.initializeApp();

mailchimp.setConfig({
  apiKey: "f12567f579ab4f258e9064ed6f2fa982-us9",
  server: "us9",
});

const corsHandler = cors({origin: true});

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

    try {
      await mailchimp.lists.addListMember("1844e08d6f", {
        email_address: email,
        merge_fields: {
          fname: fname,
          lname: lname,
        },
      });
      return res.status(200).send("Success adding user to mailchimp");
    } catch (e) {
      console.log(`newsletterSubscribe error when adding to mailchimp: ${e}`);
      return res.status(400).send(e);
    }
  });
});

