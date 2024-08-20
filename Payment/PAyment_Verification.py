import hmac
import hashlib

def verify_signature(order_id, payment_id, razorpay_signature):
    key_secret = 'YOUR_API_SECRET'
    msg = order_id + "|" + payment_id
    generated_signature = hmac.new(
        key_secret.encode(), msg.encode(), hashlib.sha256).hexdigest()
    return hmac.compare_digest(generated_signature, razorpay_signature)
