from django.urls import path
from .views import taskView


urlpatterns = [path("", taskView)]
