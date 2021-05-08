from django.contrib.auth import authenticate
from django.shortcuts import render, redirect


def Index(request):
    if request.user.is_authenticated:
        return redirect('../buscar-ficha/')
    else:
        return redirect('../accounts/login/')


def BuscarFicha(request):
    if request.user.is_authenticated:
        return render(request, 'lspd/buscar-ficha.html')
    else:
        return redirect('../accounts/login/')


def CrearFicha(request):
    if request.user.is_authenticated:
        return render(request, 'lspd/crear-ficha.html')
    else:
        return redirect('../accounts/login/')