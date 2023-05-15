import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PassoPasso extends StatefulWidget{
  const PassoPasso({Key? key}) : super(key: key);

  @override
  State<PassoPasso> createState() => _PassoPassoState();
}

class _PassoPassoState extends State<PassoPasso> with SingleTickerProviderStateMixin{

  String texto1 = 'Etapas';

  String texto2 = ''' 
  - 1º Passo – Registro do Pedido de Informação.

  - 2º Passo – Órgão responsável analisa a disponibilidade da informação.

  - 3º Passo – Envio da resposta ao cidadão.''';

  String texto3 = 'Casos em que as informações podem ser negadas';

  String texto4 = '''
  - Quando o documento se referir à investigação sigilosa.

  - Documentos classificados como reservado, secreto ou ultrassecreto.

  - Quando envolver dados pessoais de terceiros, que não seja o solicitante.''';

  String texto5 = 'Quando o cidadão não ficou satisfeito com a resposta:';

  String texto6 = 'Quando o cidadão não recebe resposta';

  String texto7 = 'Após passados os 30 dias, se o órgão demandado não enviar resposta, você pode, em até 10 dias, registrar uma '
      'reclamação pelos mesmos canais de atendimento do registro, e o órgão terá até 5 dias para enviar resposta.';

  String texto8 = ' O serviço é gratuito – Serão cobradas apenas as reproduções de:';

  String texto9 = '''
  - Cópias de documentos

  - Gravação de mídias

  - Envios postais''';

  String texto10 = 'Prazos:';

  double sizedBox = 25;

  late TransformationController controller;
  late AnimationController animationCcontroller;
  Animation<Matrix4>? animation;

  final double minScale = 1;
  final double maxScale = 4;

  void resetAnimation(){

    animation = Matrix4Tween(
      begin: controller.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(parent: animationCcontroller, curve: Curves.easeIn));

    animationCcontroller.forward(from: 0);

  }

  @override
  void initState() {
    super.initState();

    controller = TransformationController();
    animationCcontroller = AnimationController(vsync: this, duration: Duration(milliseconds: 200))
      ..addListener(()=>controller.value = animation!.value);
  }

  @override
  void dispose() {

    controller.dispose();
    animationCcontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor:
          const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Passo a Passo',
            style: GoogleFonts.kanit().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white),
          )
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(texto1,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto2,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto3,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto4,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto5,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Container(
                width: double.infinity,
                height: 220,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('imagens/instancias.png'),
                        fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(height: sizedBox,),
              Text(texto6,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto7,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto8,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto9,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              Text(texto10,
                style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: sizedBox,),
              InteractiveViewer(
                  clipBehavior: Clip.none,
                  transformationController: controller,
                  maxScale: maxScale,
                  minScale: minScale,
                  panEnabled: false,
                  onInteractionEnd: (details){
                    resetAnimation();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 220,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('imagens/prazos.png'),
                            fit: BoxFit.scaleDown
                        )
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
