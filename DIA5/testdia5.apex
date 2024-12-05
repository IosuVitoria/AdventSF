
RutaRenos ruta = new RutaRenos();

//Las coordenadas se pueden buscar en google maps. Elige cualquier punto de la ciudad que desees tener como referencia.

ruta.agregarCiudad(42.8403, -2.6726);  // Coordenadas de Vitoria.
ruta.agregarCiudad(43.2630, -2.9346);  // Coordenadas de Bilbao.
ruta.agregarCiudad(43.3183, -1.9812);  // Coordenadas de Donosti.

Decimal distanciaTotal = ruta.calcularDistanciaTotal();

System.debug('La distancia total recorrida por los renos es: ' + distanciaTotal + ' km');
