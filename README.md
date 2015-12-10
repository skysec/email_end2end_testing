eMail end2end Testing

This projects provides two scripts:

- check_exchange.rb: This script uses EWS to look for a specific email (based on the subject) in an Exchange Server, and returns the status (true|false), subject, user, date and conversation_id. It requires a working email account in the Exchange system, and the URL and user account information must be stored in the script.
- email_test.rb: This script test the comunication of the email service with external systems. Currently supports gmail and Exchange, working in the following way, email from exchange to exchange, exchange to gmail, gmail to exchange, and gmail to gmail (well, the idea isn't check gmail, but the script has been developed in way that support this schema). The configuration file is in yaml format.
