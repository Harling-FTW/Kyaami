from rest_framework import Serializers
from .models import Admin, Log_Record, Purchase, Comment, Order, To_do_list, Abuse_reports, Bug_reports

class AdminSerializer(Serializers.ModelSerializer):
    class Meta:
        model = Admin
        fields = ['admin_id' , 'role', 'cell_no', 'email', 'admin']

class LogSerializer(Serializers.ModelSerializer):
    class Meta:
        model = Log_Record
        fields  = ['location', 'device', 'username', 'time', 'login_no'] #user_id needs to be added

class PurchaseSerializer(Serializers.ModelSerializer):
    class Meta:
        model = Purchase
        fields = ['distributor', 'provider', 'purchase_time', 'purchase_details', 'purchase_id'] #user_id needs to be added

class CommentSerializer(Serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = ['reference', 'comment', 'comment_id'] #commenter_id needs to be added

class OrderSerializer(Serializers.ModelSerializer):
    class Meta:
        model= Order
        fields = ['link', 'provider', 'recipient', 'order_id'] #item needs to be added

class To_doSerializer(Serializers.ModelSerializer):
    class Meta:
        model = To_do_list
        fields = ['id', 'text', 'deadline', 'done'] 

class AbuseSerializer(Serializers.ModelSerializer):
    class Meta:
        model = Abuse_reports
        fields = ['id', 'date', 'by_user', 'by_system', 'violation'] #user needs to be added

class BugSerializer(Serializers.ModelSerializer):
    class Meta:
        model = Bug_reports
        fields = ['id', 'date', 'detail', 'category'] #user needs to be added