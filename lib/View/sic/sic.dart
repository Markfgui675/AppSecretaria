import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../telas_transparencia/servico_informacao_cidadao/autoridade_monitoramento.dart';
import '../telas_transparencia/servico_informacao_cidadao/canais_atendimento.dart';
import '../telas_transparencia/servico_informacao_cidadao/normas_regulamentacao.dart';
import '../telas_transparencia/servico_informacao_cidadao/o_que_e_pedido_info.dart';
import '../telas_transparencia/servico_informacao_cidadao/passo_passo.dart';
import '../telas_transparencia/servico_informacao_cidadao/requisitos_documentos.dart';
import '../telas_transparencia/servico_informacao_cidadao/responsável_sic.dart';
import '../telas_transparencia/servico_informacao_cidadao/sic.dart';

class SiC extends StatefulWidget {
  const SiC({Key? key}) : super(key: key);

  @override
  State<SiC> createState() => _SiCState();
}

class _SiCState extends State<SiC> {

  double width_containers = 180;
  double height_containers = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:
          const Color(0xff2E6EA7),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'SIC',
            style: GoogleFonts.kanit().copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white),
          )
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              children: <Widget>[

                //o que é
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sic()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('O que é?',
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),

                        ],
                      ),
                    )
                ),

                //o que é um pedido de info
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PedidoInfo()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('O que é um pedido de informação?',
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),

                        ],
                      ),
                    )
                ),

                //requisitos e documentos
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RequisitosDocumentos()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Requisitos e documentos',
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),

                        ],
                      ),
                    )
                ),

                //canais de atendimento
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CanaisAtendimento()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Canais de Atendimento',
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),

                        ],
                      ),
                    )
                ),

                //paso a passo
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PassoPasso()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Passo a Passo',
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),

                        ],
                      ),
                    )
                ),

                //normas e regulamentação
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NormasRegulamentacoes()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Normas e Regulamentação',
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),

                        ],
                      ),
                    )
                ),

                //responsável pelo sic(ouvidor)
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ResponsavelSic()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Responsável pelo SIC (Ouvidor)',
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),

                        ],
                      ),
                    )
                ),

                //autoridade de monitoramento
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AutoridadeMonitoramento()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 20),
                      width: width_containers,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 12,
                                offset: const Offset(0, 0)
                            )
                          ]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Autoridade de Monitoramento',
                              style: GoogleFonts.kanit().copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black)),
                          const SizedBox(height: 8,),
                          Container(width: 180, height: 5, color: Colors.orange,),

                        ],
                      ),
                    )
                ),

              ]
          ),
        ),
      ),
    );
  }
}

