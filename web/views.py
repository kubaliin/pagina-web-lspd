from django.http import HttpResponse
from django.shortcuts import render


# Create your views here.

def index(request):
    print(request.POST)
    if request.POST:
        username = request.POST.get('username')
        password = request.POST.get('password')

    return render(request, 'login.html')
