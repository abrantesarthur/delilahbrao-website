const functions = require("firebase-functions");
const mailchimp = require("@mailchimp/mailchimp_marketing");

mailchimp.setConfig({
  // TODO: add to environment file
  apiKey: "f12567f579ab4f258e9064ed6f2fa982-us9",
  server: "us9",
});

const mailchimpListId = "1844e08d6f";

exports.newsletterSignUp = functions.https.onRequest(async (req, res) => {
  // validate body
  if (req.body.email === undefined) {
    return res.status(400).send(`Request body is missing 'email' field.`);
  }
  if (req.body.first_name === undefined) {
    return res.status(400).send(`Request body is missing 'first_name' field.`);
  }
  if (req.body.last_name === undefined) {
    return res.status(400).send(`Request body is missing 'last_name' field.`);
  }

  try {
    // check if user already exists
    console.log(`subscribing member ${req.body.email} to mailchimp newsletter`);
    const r = await mailchimp.lists.addListMember(mailchimpListId, {
      email_address: req.body.email,
      status: "subscribed",
      merge_fields: {
        FNAME: req.body.first_name,
        LNAME: req.body.last_name,
      },
    });

    console.log(`successfully subscribed member ${r} to newsletter`);
    res.status(200).send(`successfully subscribed member "${r}" to newsletter`);
  } catch (e) {
    console.log(`Failed to communicate with mailchimp: ${e}`);
    res.status(500).send("Something went wrong. Try again later.");
  }
});
