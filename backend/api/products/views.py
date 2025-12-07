from django.http import HttpResponse

def home(request):
    return HttpResponse("<h1>Bienvenido a Reusapp</h1><p>El backend está funcionando correctamente.</p>")
