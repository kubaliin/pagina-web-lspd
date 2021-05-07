from django.contrib.auth import authenticate
from django.shortcuts import render, redirect


def index(request):
    if request.user.is_authenticated:
        return redirect('../admin/')
    else:
        return redirect('../accounts/login/')
