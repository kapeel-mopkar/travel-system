import razorpay
# checkout
keyid = 'rzp_test_CwanHbcfzSuqSN'
keySecret = 'F6KCMkbzogZom1sZUCrpr3o9'

client = razorpay.Client(auth=(keyid, keySecret))

data = { "amount": 10000, "currency": "INR", "receipt": "order_rcptid_11",
        "notes":{
            "name" :"Govind",
            "Paayment_for": "Ticket"
        } 
}  # amount is in paise, so 10000 paise = 100 INR
# server order-id
order = client.order.create(data=data)
print(order)


{'amount': 10000, 'amount_due': 10000, 'amount_paid': 0, 'attempts': 0, 'created_at': 1722780708,
 'currency': 'INR', 'entity': 'order', 'id': 'order_Ogqnh72afl1ayB', 
  'notes': {'Paayment_for': 'Ticket', 'name': 'Govind'}, 'offer_id': None, 'receipt': 'order_rcptid_11', 'status': 'created'}