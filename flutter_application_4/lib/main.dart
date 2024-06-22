
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
final cameras =await availableCameras();

  runApp( MyApp(cameras:cameras));
}

class MyApp extends StatelessWidget {
  final List <CameraDescription>cameras;
  MyApp({super.key,required this.cameras});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
      ),
      home:CameraScreen(cameras:cameras,),
    );
  }
}
class CameraScreen extends StatefulWidget {
    final List <CameraDescription>cameras;

  const CameraScreen({ Key? key, required this.cameras}) : super(key: key);

  @override 
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller ;
  late Future<void> _intializeControllerFuture;

  @override
  void initState (){
    super.initState();
    _controller =CameraController(
    widget.cameras[0],
    ResolutionPreset.medium,
    );
    _intializeControllerFuture = _controller.initialize(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 21, 74, 82),        
        ),
      body: FutureBuilder<void>(
        future: _intializeControllerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState== ConnectionState.done){
            return CameraPreview(_controller);
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: ()async{
          try{
            await _intializeControllerFuture;
            final path = join (
              (await getTemporaryDirectory ()).path,
              '${DateTime.now()}.png}', 
            );
            await _controller.takePicture();
            SnackBar snackBar = SnackBar(
              content: Text('picture saved to $path'), 
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }catch(e){
            print(e);
          }
        },
        child:const Icon( Icons.camera_alt)
        ),
    );
  }
  
  join(path, String s) {}
  
  getTemporaryDirectory() {}
}