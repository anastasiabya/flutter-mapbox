import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Marker> markers = [];

  void _onLongPress(var pos, LatLng latLng) {
    setState(() {
      markers.add(
        Marker(
          width: 80,
          height: 80,
          point: latLng,
          builder: (ctx) => IconButton(
            icon: const Icon(FontAwesomeIcons.mapMarkerAlt),
            color: Colors.pink[200],
            iconSize: 45,
            onPressed: () {
              showModalBottomSheet(
                  context: ctx,
                  builder: (builder) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          height: 100,
                          color: Colors.pink[200],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Coffee Like',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              ClipOval(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.white,
                                  child: Icon(
                                    Icons.location_city,
                                    size: 30,
                                    color: Colors.pink[200],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.pink[200],
                                size: 40,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.pink[200],
                                size: 40,
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.pink[200],
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.pink[200],
                                  ),
                                  const Text('Saint Petersburg'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer_sharp,
                                    color: Colors.pink[200],
                                  ),
                                  const Text('Open'),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.link,
                                    color: Colors.pink[200],
                                  ),
                                  const Text('https://coffee-like.com'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          onLongPress: _onLongPress,
          center: LatLng(59.919236, 30.349731),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "<mapboxapi>",
            additionalOptions: {
              'accessToken': '<accesstoken>',
              'id': 'mapbox.mapbox-streets-v8'
            },
          ),
          MarkerLayerOptions(markers: markers),
        ],
      ),
    );
  }
}
