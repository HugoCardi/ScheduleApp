//
//  ValidLectureList.swift
//  ScheduleMaker
//
//  Created by Hugo Cruz on 8/27/19.
//  Copyright © 2019 Hugo Cruz. All rights reserved.
//

import Foundation
let asignatura = [
	"54" : "DIBUJO  (2016)",
	"61" : "DIBUJO",
	"65" : "ESTATICA",
	"66" : "CINEMATICA Y DINAMICA",
	"712" : "PROBABILIDAD Y ESTADISTICA",
	"1128" : "REPRESENTACIONES GRAFICAS",
	"1223" : "ESTATICA (2016)",
	"1228" : "MECANICA  (2016)",
	"1306" : "ECUACIONES DIFERENCIALES",
	"1322" : "CINEMATICA Y DINAMICA (2016)",
	"1325" : "ECUACIONES DIFERENCIALES (2016)",
	"1423" : "ANALISIS NUMERICO",
	"1424" : "MATEMATICAS AVANZADAS",
	"1433" : "ANALISIS NUMERICO",
	"1436" : "PROBABILIDAD",
	"1445" : "FUNDAMENTOS DE ESTADISTICA",
	"1447" : "ESTADISTICA APLICADA A LA ING. GEOMATICA",
	"1569" : "ESTADISTICA",
	"1593" : "ESTADISTICA PARA ING. ELEC. ELECTRONICA",
	"1675" : "INFERENCIA ESTADISTICA",
	"68" : "TERMODINAMICA",
	"71" : "ELECTRICIDAD Y MAGNETISMO",
	"616" : "ACUSTICA Y OPTICA",
	"1123" : "QUIMICA (2016)",
	"1125" : "QUIMICA DE CIENCIAS DE LA TIERRA (2016)",
	"1130" : "FUNDAMENTOS DE FISICA",
	"1314" : "PRINCIPIOS DE TERMODINAMICA Y ELECTROMAGNETISMO",
	"1328" : "FISICA  (2016)",
	"1330" : "FUNDAMENTOS DE TERMODINASMICA  Y ELECTROMAGNETISMO",
	"1333" : "SISTEMAS TERMODINAMICOS-ELECTROMAG",
	"1414" : "ELECTRICIDAD Y MAGNETISMO",
	"1437" : "TERMODINAMICA",
	"1446" : "ELECTROMAGNETISMO Y OPTICA",
	"1450" : "SISTEMAS QUIMICOS EN INGENIERIA",
	"1451" : "FUNDAMENTOS DE OPTICA",
	"1452" : "INTRODUCCION A  LA FISICA DEL ESTADO SOLIDO",
	"1780" : "ACUSTICA Y OPTICA",
	"2211" : "FISICA EXPERIMENTAL (2016)",
	"5068" : "LABORATORIO DE TERMODINAMICA",
	"5071" : "LABORATORIO DE ELECTRICIDAD Y MAGNETISMO",
	"6123" : "LAB. DE QUIMICA (2016)",
	"6125" : "LAB. DE QUIMICA DE C. DE LA TIERRA (2016)",
	"6314" : "LAB. PRINCIPIOS DE TERMODINAMICA Y ELECTROMAGNETISMO",
	"6330" : "LAB FUNDAM TERMODI ELECTROM",
	"6414" : "LABORATORIO DE ELECTRICIDAD Y MAGNETISMO",
	"6437" : "LAB TERMODINAMICA",
	"6450" : "LAB SISTEMAS QUIMICOS EN ING",
	"62" : "ALGEBRA LINEAL",
	"63" : "CALCULO VECTORIAL",
	"1120" : "ALGEBRA (2016)",
	"1121" : "CALCULO Y GEOMETRIA ANALITICA (2016)",
	"1207" : "CALCULO INTEGRAL",
	"1220" : "ALGEBRA LINEAL (2016)",
	"1221" : "CALCULO INTEGRAL (2016)",
	"1321" : "CALCULO VECTORIAL (2016)",
	"762" : "RECURSOS Y NECESIDADES DE MEXICO",
	"950" : "INTRODUCCION AL ANALISIS ECONOMICO EMPRESARIAL",
	"953" : "REDACCION Y EXPOSICION DE TEMAS DE INGENIERIA",
	"1052" : "ETICA PROFESIONAL",
	"1055" : "LITERATURA HISPANOAMERICANA CONTEMPORANEA",
	"1124" : "REDACCION Y EXPOSICION DE TEMAS DE ING.(2016)",
	"1211" : "INTRODUCCION A LA ECONOMIA",
	"1222" : "CULTURA Y COMUNICACION (2016)",
	"1413" : "INTRODUCCION A LA ECONOMIA",
	"1416" : "TEMAS SELECTOS DE LA FILOSOFIA DE LA CIENCIA Y LA TECNOLOGIA",
	"1420" : "LITERATURA HISPANOAMERICANA CONTEMPORANEA",
	"1789" : "CIENCIA TECNOLOGIA Y SOCIEDAD",
	"1790" : "INTRODUCCION AL ANALISIS ECONOMICO EMPRESARIAL",
	"1793" : "SEMINARIO SOCIO-HU.:INGENIERIA Y POLITICAS PUBLICAS",
	"1794" : "SEMINARIO SOCIO-HU.: INGENIERIA SUSTENTABLE",
	"1795" : "TALLER SOCIOHUMANISTIO:CREATIVIDAD",
	"1796" : "TALLER SOCIHUMANISTIO: LIDERAZGO",
	"2080" : "RECURSOS Y NECESIDADES DE MEXICO",
	"2188" : "ETICA PROFESIONAL",
	"129" : "DINAMICA DE SISTEMAS FISICOS",
	"422" : "AUTOMATIZACION",
	"558" : "MEDICION E INSTRUMENTACION",
	"607" : "AUDIOMETRIA",
	"678" : "CONTROL AUTOMATICO INDUSTRIAL",
	"692" : "FUNDAMENTOS DE INSTRUMENTACION BIOMEDICA",
	"693" : "INSTRUMENTACION VIRTUAL",
	"936" : "INTRODUCCION A LA FISIOLOGIA",
	"942" : "TEMAS SELECTOS DE ING. BIOMEDICA",
	"955" : "SISTEMAS Y EQUIPOS BIOMEDICOS ELECTRONICOS",
	"967" : "TRANSDUCTORES BIOMEDICOS",
	"1093" : "CONTROL SISTEMAS NO LINEALES",
	"1094" : "CONTROLADORES E INSTRUMENTOS BASADOS EN MICROS",
	"1095" : "CONTROL DISTRIBUIDO E INTEGRACION SCADA",
	"1418" : "ANALISIS DE SISTEMAS Y SEÑALES",
	"1443" : "ANALISIS DE SISTEMAS Y SEÑALES",
	"1454" : "SISTEMAS Y SEÑALES",
	"1460" : "ELEMENTOS DE CONTROL",
	"1463" : "TEORIA DE CIRCUITOS",
	"1473" : "SEÑALES Y SISTEMAS",
	"1546" : "ANALISIS DE CIRCUITOS ELECTRICOS",
	"1547" : "DINAMICA DE SISTEMAS FISICOS",
	"1562" : "CIRCUITOS ELECTRICOS",
	"1564" : "ELEMENTOS DE CONTROL",
	"1592" : "ANALISIS DE CIRCUITOS ELECTRICOS",
	"1655" : "FUNDAMENTOS DE CONTROL",
	"1879" : "SISTEMAS DE CONTROL",
	"1881" : "CONTROL AVANZADO",
	"1882" : "CONTROL DE ROBOTS INDUSTRIALES",
	"1883" : "CONTROLADORES INDUSTRIALES DE LOGICA PROGRAMABLE",
	"1997" : "FUNDAMENTOS DE CONTROL",
	"2005" : "TEMAS SELECTOS DE CONTROL Y ROBOTICA",
	"2909" : "CONTROL AVANZADO",
	"2911" : "ROBOTICA INDUSTRIAL",
	"5422" : "LABORATORIO DE AUTOMATIZACION",
	"5558" : "LAB. MEDICION E INSTRUMENTACION",
	"5678" : "LAB. CONTROL AUTOMATICO INDUSTRIAL",
	"5692" : "LAB. FUNDAMENTOS DE INSTRUMENTACION BIOMEDICA",
	"5693" : "LAB. INSTRUMENTACION VIRTUAL",
	"6093" : "LAB. CONTROL DE SISTEMAS NO LINEALES",
	"6094" : "LAB. CONTROLADORES E INSTRUMENTOS BASADOS EN MICROS",
	"6095" : "LAB. CONTROL DISTRIBUIDO E INTEGRACION SCADA",
	"6443" : "LAB ANALISIS DE  SISTEMAS Y SEÑALES",
	"6463" : "LAB TEORIA DE CIRCUITOS",
	"6473" : "LAB SEÑALES Y SISTEMAS",
	"6546" : "LAB. ANALISIS DE CIRCUITOS ELECTRICOS",
	"6562" : "LAB. CIRCUITOS ELECTRICOS",
	"6564" : "LAB. ELEMENTOS DE CONTROL",
	"6592" : "LAB ANALISIS DE CIRCUITOS ELECTRICOS",
	"6655" : "LAB. FUNDAMENTOS DE CONTROL",
	"6879" : "LAB. SISTEMAS DE CONTROL",
	"6881" : "LAB. CONTROL AVANZADO",
	"6882" : "LAB. CONTROL DE ROBOTS INDUSTRIALES",
	"6883" : "LAB. CONTROLADORES INDUSTRIALES DE LOGICA PROGRAMABLE",
	"6997" : "LABORATORIO DE FUNDAMENTOS DE CONTROL",
	"7909" : "LAB. CONTROL AVANZADO",
	"7911" : "LAB ROBOTICA INDUSTRIAL",
	"138" : "DISPOSITIVOS ELECTRONICOS",
	"145" : "ELECTRONICA DE POTENCIA",
	"425" : "CIRCUITOS PARA COMUNICACIONES",
	"426" : "DISPOS ELECTRONIC PROGRAMABL",
	"427" : "INTROD A LA TECNOLOGIA MEMS",
	"583" : "ELECTRONICA DIGITAL",
	"621" : "CIRCUITOS INTEGRADOS ANALOGICOS",
	"918" : "SISTEMAS DIFUSOS",
	"919" : "SISTEMAS EMBEBIDOS",
	"1010" : "SISTEMAS EMBEBIDOS",
	"1091" : "AMPLIFICADORES DE ALTA FRECUENCIA",
	"1421" : "FISICA DE SEMICONDUCTORES",
	"1453" : "SISTEMAS DIGITALES",
	"1594" : "FISICA DE SEMICONDUCTORES",
	"1617" : "DISEÑO DIGITAL",
	"1618" : "DISPOSITIVOS Y CIRCUITOS ELECTRONICOS",
	"1654" : "DISPOSITIVOS Y CIRCUITOS ELECTRONICOS",
	"1723" : "AMPLIFICADORES ELECTRONICOS",
	"1748" : "DISEÑO DIGITAL",
	"1822" : "CIRCUITOS INTEGRADOS ANALOGICOS",
	"1855" : "AMPLIFICADORES ELECTRONICOS",
	"1856" : "ELECTRONICA DE POTENCIA",
	"1857" : "MICROPROCESADORES Y MICROCONTROLADORES",
	"1893" : "SISTEMAS ELECTRONICOS ANALOGICOS",
	"1937" : "MICROPROCESADORES Y MICROCONTROLADORES",
	"1957" : "ELECTRONICA PARA TELECOMUNICACIONES",
	"2000" : "INSTRUMENTACION ELECTRONICA",
	"2006" : "TEMAS SELECTOS DE ELECTRONICA",
	"2309" : "REDES EMBEBIDAS INALAMBRICAS",
	"3001" : "PROYECTOS DE INVESTIGACION ELECTRICO- ELECTRONICO",
	"5138" : "LABORATORIO DE DISPOSITIVOS ELECTRONICOS",
	"5425" : "LABORATORIO CIRCUITOS PAR COMUNICACIONES",
	"5583" : "LAB. ELECTRONICA DIGITAL",
	"5621" : "LAB. CIRCUITOS INTEGRADOS ANALOGICOS",
	"6453" : "LAB SISTEMAS DIGITALES",
	"6617" : "LABORATORIO DE DISEÑO DIGITAL",
	"6618" : "LABORATORIO DE DISPOSITVOS Y CIRCUITOS ELECTRONICOS",
	"6654" : "LAB. DISPOSITIVOS Y CIRCUITOS ELECTRONICOS",
	"6723" : "LABORATORIO DE  AMPLIFICADORES ELECTRONICOS",
	"6748" : "LAB. DISEÑO DIGITAL",
	"6822" : "LABORATORIO CIRCUITOS INTEGRADOS ANALOGICOS",
	"6855" : "LAB. AMPLIFICADORES ELECTRONICOS",
	"6857" : "LAB. MICROPROCESADORES Y MICROCONTROLADORES",
	"6893" : "LAB. SISTEMAS ELECTRONICOS ANALOGICOS",
	"6937" : "LABORATORIO DE MICROPROCESADORES Y MICROCONTROLADORES",
	"6957" : "LAB. ELECTRONICA PARA TELECOMUNICACIONES",
	"7000" : "LAB. INSTRUMENTACION ELECTRONICA",
	"119" : "ESTRUCTURAS DISCRETAS",
	"406" : "INTELIGENCIA ARTIFICIAL",
	"434" : "COMPILADORES",
	"442" : "LENGUAJES FORMALES Y AUTOMATAS",
	"575" : "ANALlSIS Y PROCESAMIENTO INTELlGENTE DE TEXTOS",
	"602" : "APRENDIZAJE",
	"606" : "ARQUITECTURAS CLlENTE/SERVIDOR",
	"608" : "BASES DE DATOS AVANZADAS",
	"609" : "BASES DE DATOS DISTRIBUIDAS",
	"620" : "BASES DE DATOS ESPACIALES",
	"674" : "COMPUTO MOVIL",
	"676" : "COMPUTO DE ALTO DESEMPEÑO",
	"677" : "COMPUTACION GRAFICA AVANZADA",
	"681" : "CRIPTOGRAFIA",
	"684" : "DEPOSITOS DE DATOS",
	"686" : "DISEÑO ASISTIDO POR COMPUTADORA",
	"689" : "DISEÑO DE INTERFACES, MULTIMEDIA Y REALlDAD VIRTUAL",
	"695" : "MINERIA DE DATOS",
	"751" : "PROCESAMIENTO DEL LENGUAJE NATURAL",
	"755" : "PROYECTO DE INVESTIGACION",
	"756" : "ROBOTS MOVILES Y AGENTES INTELlGENTES",
	"757" : "RECONOCIMIENTO DE PATRONES",
	"840" : "SISTEMAS OPERATIVOS",
	"880" : "SEGURIDAD INFORMATICA I",
	"916" : "SEGURIDAD INFORMATICA II",
	"917" : "SEMINARIO DE TITULACION",
	"929" : "SISTEMAS EXPERTOS",
	"943" : "ADMINISTRACION DE CENTROS DE TECNOLOGIA DE INFORMACION",
	"951" : "NEGOCIOS ELECTRONICOS",
	"958" : "TEMAS SELECTOS DE BASES DE DATOS",
	"959" : "TEMAS SELECTOS DE GRAFICACION",
	"964" : "TEMAS SELECTOS DE REDES Y SEGURIDAD",
	"965" : "TEMAS SELECTOS DE SISTEMAS INTELlGENTES",
	"966" : "TEMAS SELECTOS DE TECNOLOGlAS DEL LENGUAJE",
	"968" : "VERIFICACION Y VALlDACION DE SOFTWARE",
	"1122" : "FUNDAMENTOS DE PROGRAMACION (2016)",
	"1127" : "PROGRAMACION BASICA",
	"1227" : "ESTRUCTURA DE DATOS Y ALGORITMOS I",
	"1312" : "PROGRAMACION AVANZADA Y METODOS NUMERICOS",
	"1317" : "ESTRUCTURA DE DATOS Y ALGORIMOS II",
	"1323" : "PROGRAMACION ORIENTADA A OBJETOS",
	"1332" : "MODELOS DE PROGRAMACION ORIENTADA A OBJETOS",
	"1422" : "ALGORITMOS Y ESTRUCTURAS DE DATOS",
	"1429" : "ESTRUCTURA Y PROGRAMACION DE COMPUTADORAS",
	"1503" : "ESTRUCTURA Y PROGRAMACION  DE COMPUTADORAS",
	"1531" : "INGENIERIA DE SOFTWARE",
	"1535" : "DISEÑO DIGITAL VLSI",
	"1537" : "FINANZAS EN LA INGENIERIA EN COMPUTACION",
	"1551" : "DISEÑO DE SISTEMAS DIGITALES",
	"1552" : "ESTRUCTURAS DISCRETAS",
	"1553" : "INGENIERIA DE SOFTWARE",
	"1554" : "SISTEMAS OPERATIVOS",
	"1590" : "COMPUTACION GRAFICA E INTERACCION HUMANO-COMPUTADORA",
	"1598" : "REDES DE DATOS SEGURAS",
	"1643" : "ADMINISTRACION DE PROYECTOS DE SOFTWARE",
	"1644" : "BASES DE DATOS",
	"1645" : "DISEÑO DIGITAL MODERNO",
	"1669" : "COMPUTACION GRAFICA",
	"1670" : "LENGUAJES FORMALES Y AUTOMATAS",
	"1671" : "LENGUAJES DE PROGRAMACION",
	"1672" : "MICROCOMPUTADORAS",
	"1762" : "ARQUITECTURA DE COMPUTADORAS",
	"1763" : "BASES DE DATOS",
	"1764" : "COMPILADORES",
	"1765" : "DISPOSITIVOS DE ALMACENAMIENTO E/S",
	"1766" : "INTELIGENCIA ARTIFICIAL",
	"1767" : "REDES DE DATOS",
	"1858" : "FUNDAMENTOS DE SISTEMAS EMBEBIDOS",
	"1865" : "ADMINISTRACION DE PROYECTOS DE SOFTWARE",
	"1866" : "ADMINISTRACION DE REDES",
	"1867" : "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS",
	"1959" : "SISTEMAS DISTRIBUIDOS",
	"2910" : "CONTROLADORES INDUSTRIALES PROGRAMABLES",
	"2928" : "ADMINISTRACION DE PROYECTOS TIC",
	"2929" : "BASES DE DATOS AVANZADAS",
	"2930" : "CRIPTOGRAFIA",
	"2931" : "NEGOCIOS ELECTRONICOS Y DESARROLLO DE PAGINAS WEB",
	"2932" : "ANALISIS Y PROCESAMIENTO INTELIGENTE DE TEXTOS",
	"2933" : "MINERIA DE DATOS",
	"2934" : "SEGURIDAD INFORMATICA BASICA",
	"2956" : "TEMAS SELECTOS DE INGENIERIA EN COMPUTACION I",
	"2957" : "TEMAS SELECTOS DE INGENIERIA EN COMPUTACION II",
	"2958" : "TEMAS SELECTOS DE INGENIERIA EN COMPUTACION III",
	"6312" : "LAB. DE PROG. AVANZADA Y METODOS NUMERICOS",
	"6551" : "LAB. DISEÑO DE SISTEMAS DIGITALES",
	"6590" : "LABORATORIO COMPUTACION GRAFICA E INTERACCION HUMANO-COMPUTADORA",
	"6598" : "LABORATORIO DE REDES DE DATOS SEGURAS",
	"6644" : "LABORATORIO DE BASES DE DATOS",
	"6645" : "LABORATORIO DISEÑO DIGITAL MODERNO",
	"6669" : "LAB. COMPUTACION GRAFICA",
	"6672" : "LAB. MICROCOMPUTADORAS",
	"6765" : "LAB. DISPOSITIVOS DE ALMACENAMIENTO E/S",
	"6767" : "LAB. REDES DE DATOS",
	"6866" : "LAB. ADMINISTRACION DE REDES",
	"6867" : "LABORATORIO ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS",
	"7910" : "LAB CONTROLADORES INDUSTRIALES PROGRAMABLES",
	"423" : "INSTALACIONES ELECTRICAS",
	"1016" : "SUBESTACIONES ELECTRICAS",
	"1064" : "SISTEMAS ELECTRICOS DE POTENCIA II",
	"1099" : "ILUMINACION",
	"1656" : "MAQUINAS ELECTRICAS I",
	"1749" : "SISTEMAS ELECTRICOS DE POTENCIA I",
	"1885" : "INSTALACIONES ELECTRICAS INDUSTRIALES",
	"1889" : "MAQUINAS ELECTRICAS II",
	"1890" : "PLANTAS GENERADORAS",
	"1892" : "PROTECCION DE SISTEMAS ELECTRICOS",
	"1894" : "SUBESTACIONES ELECTRICAS",
	"1936" : "SISTEMAS ELECTRICOS DE POTENCIA I",
	"1998" : "MAQUINAS ELECTRICAS I",
	"2003" : "SISTEMAS DE DISTRIBUCION",
	"2004" : "SISTEMAS DE TRANSPORTE ELECTRICO",
	"2900" : "MAQUINAS ELECTRICAS II L",
	"2908" : "SIST ELECTRONIC DE POTEN II",
	"6064" : "LAB. SISTEMAS ELECTRICOS DE POTENCIA II",
	"6656" : "LAB. MAQUINAS ELECTRICAS I",
	"6749" : "LAB. SISTEMAS ELECTRICOS DE POTENCIA I",
	"6889" : "LAB. MAQUINAS ELECTRICAS II",
	"6892" : "LAB. PROTECCION DE SISTEMAS ELECTRICOS",
	"6936" : "LABORATORIO DE SISTEMAS ELECTRICOS DE POTENCIA I",
	"6998" : "LABORATORIO DE MAQUINAS ELECTRICAS I",
	"7900" : "LABORATORIO MAQUINAS ELECTRICAS II L",
	"7908" : "LABORATORIO SIST ELECTRONIC DE POTEN II",
	"753" : "PROCESAMIENTO DIGITAL DE IMAGENES",
	"754" : "PROCESAMIENTO DIGITAL DE IMAGENES MEDICS: Imagenologia",
	"1958" : "PROCESAMIENTO DIGITAL DE SEÑALES",
	"2901" : "PROCESAMIENTO DIGITAL DE SEÑALES",
	"5754" : "LAB. PROCESAMIENTO DIGITAL DE IMÁGENES MEDICAS",
	"1097" : "FUNDAMENTOS DE ENERGIA NUCLEAR",
	"1428" : "ENERGIAS RENOVABLES",
	"1624" : "ENERGIA E IMPACTO AMBIENTAL",
	"1668" : "PLANEACION E INSTALACION DE SISTEMAS BIOENERGETICOS",
	"2001" : "INTRODUCCION A LA CONVERSION DE ENERGIA",
	"2002" : "PLANEACION DE SISTEMAS DE GENERACION ELECTRICA",
	"2009" : "TEMAS SELECTOS DE SISTEMAS ENERGETICOS",
	"2012" : "USO EFICIENTE EN EQUIPOS DE SERVICIO",
	"3008" : "ENERGIAS RENOVABLES",
	"3009" : "FUNDAMENTOS DE INGENIERIA NUCLEAR",
	"109" : "COMUNICACIONES DIGITALES",
	"530" : "ANALISIS Y DISEÑO DE REDES DE DATOS",
	"758" : "REDES INALAMBRICAS AVANZADAS",
	"879" : "TEORIA ELECTROMAGNETICA",
	"963" : "TEMAS SELECTOS DE NORMALIZACION",
	"1138" : "PRINCIPIOS PRACT DE ELECTRONICA",
	"1458" : "CAMPOS Y ONDAS",
	"1459" : "DISPOSITIVOS DE RADIOFRECUENCIA",
	"1461" : "FUNDAMENTOS DE PROCESOS ALEATORIOS",
	"1462" : "FUNDAMENTOS DE SISTEMAS DE COMUNICACION",
	"1467" : "CIRCUITOS DE RADIOFRECUENCIA",
	"1469" : "FUNDAMENTOS Y APLICACIONES PARA EL PROCESAMIENTO DIGITAL DE SEÑALES",
	"1470" : "INTRODUCCION A LA CODIFICACION DE FUENTE Y CANAL",
	"1549" : "TEORIA ELECTROMAGNETICA",
	"1560" : "ANALISIS DE SEÑALES ALEATORIAS",
	"1561" : "CAMPOS Y ONDAS",
	"1563" : "DISPOSITIVOS  DE RADIO FRECUENCIA",
	"1565" : "FUNDAMENTOS DE SISTEMAS DE COMUNICACIONES",
	"1657" : "SISTEMAS DE COMUNICACIONES ELECTRONICAS",
	"1680" : "CIRCUITOS DE RADIO FRECUENCIA",
	"1681" : "COMUNICACIONES DIGITALES",
	"1682" : "MEDIOS DE TRANSMISION",
	"1683" : "PROCESAMIENTO DIGITAL DE SEÑALES PARA COMUNICACIONES",
	"1684" : "TEORIA DE LA INFORMACION Y LA CODIFICACION",
	"1686" : "SISTEMAS DE COMUNICACIONES",
	"1773" : "ANTENAS",
	"1774" : "DISPOSITIVOS DE MICROONDAS I",
	"1775" : "RECEPTORES",
	"1776" : "REDES DE DATOS I",
	"1777" : "TECNOLOGIAS PARA PROCESAMIENTO DIGITAL DE SEÑALES",
	"1874" : "DISPOSITIVOS  DE MICROONDAS II",
	"1875" : "SISTEMAS DE COMUNICACIONES OPTICAS",
	"1876" : "SISTEMAS DE RADIOCOMUNICACIONES I",
	"1877" : "TELEFONIA DIGITAL",
	"1878" : "TRANSMISORES",
	"1972" : "ADMINISTRACION REGULACION DE LAS TELECOMUNICACIONES",
	"1974" : "REDES INALAMBRICAS Y MOVILES",
	"1975" : "SISTEMAS DE RADIO COMUNICACIONES II",
	"1999" : "SISTEMAS DE COMUNICACIONES ELECTRONICAS",
	"2048" : "DISPOSITIVOS CUANTICOS",
	"2049" : "DISPOSITIVOS OPTICOS",
	"2052" : "LEGISLACION Y NORMALIZACION DE LAS TELECOMUNICACIONES",
	"2055" : "RADIODIFUSION",
	"2056" : "REDES DE DATOS II",
	"2057" : "REDES OPTICAS Y DE MICROONDAS",
	"2059" : "TEMAS SELECTOS DE TELECOMUNICACIONES",
	"2304" : "PROYECTOS DE INVESTIGACIÓN PARA TELECOMUNICACIONES",
	"2306" : "TEMAS SELECTOS DE TELECOMUNICACIONES",
	"2307" : "POLITICA Y LEGISLACION TELECOMUNICACIONES",
	"2310" : "TECNOLOGIA E INTERCONEXION DE REDES II",
	"2315" : "REDES OPTICAS Y DE ACCESO",
	"2704" : "PROCESAMIENTO DE SEÑALES DIGITALES EN  TIEMPO REAL",
	"2705" : "REDES DE TELECOMUNICACIONES",
	"2706" : "TRANSMISORES Y RECEPTORES",
	"2813" : "SISTEMAS DE RADIOCOMUNICACIONES I",
	"2814" : "TECNOLOGIAS E INTERCONEXION DE REDES",
	"2962" : "REGULACION DE LAS TELECOMUNICACIONES",
	"2963" : "SISTEMAS DE RADIOCOMUNICACIONES II",
	"5109" : "LABORATORIO DE COMUNICACIONES DIGITALES",
	"5879" : "LABORATORIO DE TEORIA ELECTROMAGNETICA",
	"6459" : "LAB DISPOSITIVOS DE RADIOFRECUENCIA",
	"6462" : "LAB FUNDAMENTOS DE SISTEMAS DE COMUNICACION",
	"6467" : "LABORATORIO DE CIRCUITOS DE RADIOFRECUENCIA",
	"6549" : "LAB. TEORIA ELECTROMAGNETICA",
	"6563" : "LAB. DISPOSITIVOS  DE RADIO FRECUENCIA",
	"6565" : "LAB. FUNDAMENTOS DE SISTEMAS DE COMUNICACIONES",
	"6657" : "LAB. SISTEMAS DE COMUNICACIONES ELECTRONICAS",
	"6680" : "LAB. CIRCUITOS DE RADIO FRECUENCIA",
	"6681" : "LAB. COMUNICACIONES DIGITALES",
	"6682" : "LAB. MEDIOS DE TRANSMISION",
	"6686" : "LAB. SISTEMAS DE COMUNICACIONES",
	"6773" : "LAB. ANTENAS",
	"6774" : "LAB. DISPOSITIVOS DE MICROONDAS I",
	"6775" : "LAB. RECEPTORES",
	"6777" : "LAB. TECNOLOGIAS PARA PROCESAMIENTO DIGITAL DE SEÑALES",
	"6874" : "LAB. DISPOSITIVOS DE MICROONDAS II",
	"6875" : "LAB. SISTEMAS DE COMUNICACIONES OPTICAS",
	"6877" : "LAB. TELEFONIA DIGITAL",
	"6878" : "LAB. TRANSMISORES",
	"6999" : "LABORATORIO DE SISTEMAS DE COMUNICACIONES ELECTRONICA",
	"7704" : "LAB. PROCESAMIENTO DE SEÑALES DIGITALES EN  TIEMPO REAL",
	"7706" : "LAB. TRANSMISORES Y RECEPTORES",
	"720" : "PROYECTOS MINERO METALURGICOS",
	"832" : "SEGURIDAD E HIGIENE",
	"914" : "VENTILACION",
	"948" : "TEMAS SELECTOS",
	"1131" : "INTRODUCCION A LA INGENIERIA DE MINAS Y METALURGIA",
	"1455" : "ANALISIS QUIMICO",
	"1456" : "LEGISLACION MINERA",
	"1457" : "METODOS DE MEDICION  MINERO-CARTOGRAFICOS",
	"1464" : "FUNDAMENTOS DE METALURGIA EXTRACTIVA",
	"1465" : "FUNDAMENTOS PARA LA EXPLOTACION DE MINAS",
	"1557" : "ANALISIS QUIMICO",
	"1559" : "TOPOGRAFIA PARA MINEROS",
	"1625" : "FISICOQUIMICA",
	"1678" : "FUNDAMENTOS PARA EXPLOTACION DE MINAS",
	"1771" : "EXPLOTACION DE MINAS SUBTERRANEAS",
	"1813" : "PIROMETALURGIA",
	"1835" : "ADMINISTRACION DE INVERSIONES MINERAS",
	"1872" : "EXPLOTACION DE MINAS A CIELO ABIERTO",
	"1873" : "MATERIALES Y PROCEDIMIENTOS DE CONSTRUCCION",
	"1909" : "EVALUACION DE PROYECTOS DE INVERSION",
	"1911" : "HIDRO-ELECTROMETALURGIA",
	"1914" : "INSTALACIONES MINERO-METALURGICAS",
	"1938" : "ECONOMIA MINERA",
	"1939" : "INSTALACIONES MINERO METALURGICAS",
	"1971" : "OPERACIONES AUXILIARES PARA LA EXPLOTACION DE MINAS",
	"2038" : "DISENO Y OPERACION DE ALMACENAMIENTOS DE RESIDUOS MINEROS",
	"2045" : "TEMAS SELECTOS DE METALURGIA",
	"2147" : "VENTILACION",
	"2160" : "EVALUACION AMBIENTAL",
	"2701" : "EXPLOTACION DE MINAS SUBTERRANEAS",
	"2702" : "MECANICA APLICADA Y PROCEDIMIENTOS DE CONSTRUCCION",
	"2703" : "PREPARACION Y CONCENTRACION  DE MINERALES",
	"2807" : "ADMINISTRACION APLICADA A LA MINERIA",
	"2808" : "EXPLOTACION DE MINAS A CIELO ABIERTO",
	"2809" : "GESTION AMBIENTAL EN MINERIA",
	"2810" : "HIDRO Y PIROMETALURGIA",
	"2959" : "ANALISIS Y EVALUACION DE PROYECTOS DE INVERSION",
	"2960" : "DISEÑO DE OPERACIONES METALURGIAS",
	"2961" : "INTRODUCCION AL DISEÑO DE OPERACIONES MINERAS",
	"3092" : "DEPOSITOS DE RESIDUOS MINEROS",
	"3094" : "MINERALES NO METALICOS",
	"298" : "FISICA DE LAS ONDAS",
	"352" : "INTRODUCCION A LA GEOFISICA",
	"416" : "MECANICA DEL MEDIO CONTINUO",
	"531" : "MECANICA DEL MEDIO CONTINUO",
	"969" : "PETROFISICA Y REGISTROS DE POZO",
	"1023" : "SISMOLOGIA APLICADA A LA EXPLOTACION PETROLERA",
	"1024" : "PROCESAMIENTO DE DATOS SISMICOS PETROLEROS",
	"1026" : "PERCEPCION REMOTA APLICADA",
	"1028" : "FUENTE SISMICA",
	"1030" : "SISMOLOGIA DE MOVIMIENTOS FUERTES",
	"1079" : "SISMOLOGIA APLlCADA A LA EXPLORACION PETROLERA",
	"1141" : "TEMAS SEL.DE ING GEOFISICA I",
	"1142" : "TEMAS SEL.D ING GEOFISICA II",
	"1468" : "INTRODUCCION A LA GEOFISICA",
	"1577" : "PROSPECCION GEOFISICA DE REGISTROS DE POZOS",
	"1591" : "REGISTROS GEOFISICOS EN POZO",
	"1639" : "ANALISIS ESPECTRAL DE SEÑALES",
	"1641" : "TEORIA DEL POTENCIAL APLICADA A LA GEOFISICA",
	"1743" : "INTRODUCCION AL DISEÑO DE FILTROS DIGITALES",
	"1768" : "PROSPECCION GRAVIMETRICA Y MAGNETOMETRICA",
	"1847" : "INTRODUCCION AL TRATAMIENTO DE SEÑALES",
	"1868" : "PROSPECCION SISMICA",
	"1869" : "PROSPECCION ELECTRICA",
	"1967" : "INVERSION DE DATOS GEOFISICOS",
	"1968" : "PETROFISICA Y REGISTROS GEOFISICOS DE POZOS",
	"1969" : "PROSPECCION ELECTROMAGNETICA",
	"2014" : "PERCEPCION REMOTA APLlCADA",
	"2015" : "TEMAS SELECTOS DE EXPLORACION MINERA",
	"2016" : "FUENTE SISMICA",
	"2018" : "SISMOLOGIA DE MOVIMIENTOS FUERTES",
	"2021" : "SINOPSIS ATMOSFERICA",
	"2022" : "CLlMATOLOGIA",
	"2025" : "TEMAS SELECTOS DE HIDROGEOLOGIA",
	"2026" : "PROCESAMIENTO DE DATOS SISMICOS PETROLEROS",
	"2027" : "TEMAS SELECTOS DE EXPLORACION PETROLERA",
	"2028" : "SISMOLOGIA APLlCADA A LA GEOTECNIA",
	"2029" : "TEMAS SELECTOS DE GEOTECNIA",
	"2032" : "TEMAS SELECTOS DE GEOFISICA AMBIENTAL",
	"2094" : "PETROFISICA Y REGISTRO  GEOFISICO DE POZOS",
	"2128" : "PROCESAMIENTO DE DATOS GEOFISICOS",
	"2189" : "PROYECTO TERMINAL",
	"2503" : "TEORIA DEL POTENCIAL APLICADA A LA GEOFISICA",
	"2504" : "VARIABLE COMPLEJA APLICADA A LA GEOFISICA",
	"2605" : "ANALISIS ESPECTRAL DE SEÑALES",
	"2606" : "FISICA DE LAS ONDAS",
	"2607" : "FUNDAMENTOS DE TEORIA ELECTROMAGNETICA",
	"2707" : "INTRODUCCION AL DISEÑO DE FILTROS DIGITALES",
	"2708" : "PROSPECCION GRAVIMETRICA Y MAGNETOMETRICA",
	"2709" : "PROSPECCION SISMICA I",
	"2815" : "INTRODUCCION AL TRATAMIENTO SEÑALES",
	"2816" : "PROSPECCION ELECTRICA",
	"2817" : "PROSPECCION SISMICA II",
	"2966" : "INVERSION DE DATOS GEOFISICOS",
	"2967" : "PROSPECCION ELECTROMAGNETICA",
	"252" : "GEOLOGIA ESTRUCTURAL",
	"289" : "GEOMORFOLOGIA",
	"312" : "GEOLOGIA APLICADA A LA INGENIERIA CIVIL",
	"424" : "GEOLOGIA GENERAL  (2016)",
	"468" : "MECANICA DE ROCAS",
	"495" : "MECANICA DE SUELOS",
	"1046" : "GEOLOGIA URBANA",
	"1061" : "GEOLOGIA APLICADA A LA INGENIERIA CIVIL",
	"1067" : "GEOMETRIA DESCRIPTIVA APLICADA",
	"1319" : "GEOMETRIA DESCRIPTIVA APLICADA",
	"1327" : "GEOLOGIA FISICA",
	"1438" : "TECNICAS GEOLOGICAS DE CAMPO",
	"1572" : "GEOLOGIA ESTRUCTURAL",
	"1575" : "GEOLOGIA DE CAMPO Y CARTOGRAFIA",
	"1576" : "GEOMORFOLOGIA",
	"1578" : "SISTEMAS DE INFORMACION GEOGRAFICA",
	"1583" : "MECANICA DE ROCAS",
	"1586" : "PROYECTOS DE INGENIERIA GEOLOGICA",
	"1587" : "GEOLOGIA DE MEXICO",
	"1674" : "GEOLOGIA DE CAMPO",
	"1805" : "GEOTECNIA DE EXCAVACION",
	"1870" : "ESTANCIAS PROFESIONALES",
	"2036" : "SISTEMAS DE INFORMACION GEOGRAFICA I",
	"2121" : "MECANICA DE ROCAS",
	"157" : "COMPORTAMIENTO DE YACIMIENTOS",
	"461" : "MECANICA DE FLUIDOS",
	"956" : "ASEGURAMIENTO DE FLUJO",
	"960" : "CARACTERIZACION ESTATICA Y DINAMICA DE YACIMIENTOS NATURALMENTE FRACTU",
	"970" : "COMERCIALIZACION DE CRUDO Y GAS NATURAL",
	"977" : "FRACTURAMIENTO HIDRAULICO",
	"978" : "METROLOGIA APLICADA A LA MEDICION DE CAUDAL O VOLUMEN DE HIDROCARBUROS",
	"1068" : "INGENIERIA DE PERFORACION DE POZOS",
	"1069" : "FLUIDOS DE PERFORACION",
	"1071" : "PERFORACION DE POZOS EN AGUAS PROFUNDAS",
	"1073" : "COMERCIALlZACION DE CRUDO Y GAS NATURAL",
	"1080" : "FRACTURAMIENTO HIDRAULICO",
	"1081" : "YACIMIENTOS DE GAS DE BAJA PERMEABILlDAD",
	"1084" : "GEOLOGIA DE YACIMIENTOS NATURALMENTE FRACTTURADOS",
	"1089" : "INGENIERIA DE YACIMIENTOS GEOTERMICOS",
	"1090" : "SIMULACION MATEMATICA DE YACIMIENTOS",
	"1126" : "INTRODUCCION A LA INGENIERIA PETROLERA (2016)",
	"1439" : "FLUIDOS DE PERFORACION",
	"1441" : "MECANICA DE FLUIDOS",
	"1442" : "PROPIEDADES DE LOS FUIDOS PETROLEROS",
	"1588" : "BOMBEO Y COMPRESION DE HIDROCARBUROS",
	"1589" : "PRINCIPIOS DE MECANICA DE YACIMIENTOS",
	"1661" : "CARACTERIZACION ESTATICA DE YACIMIENTOS",
	"1662" : "ELEMENTOS DE PERFORACION DE POZOS",
	"1663" : "FLUJO MULTIFASICO EN TUBERIA",
	"1664" : "PLANEACION ADMINISTRACION DE PROYECTOS DE CIENCIAS DE LA TIERRA",
	"1665" : "PRODUCTIVIDAD DE POZOS",
	"1666" : "PROGRAMACION AVANZADA",
	"1746" : "PROCESOS DE BOMBEO Y COMPRESION DE HIDROCARBUROS",
	"1757" : "CARACTERIZACION DINAMICA DE YACIMIENTOS",
	"1758" : "EVALUACION DE PROYECTOS DE CIENCIAS DE LA TIERRA",
	"1759" : "INGENIERIA DE PERFORACION DE POZOS",
	"1861" : "ADMINISTRACION DE LA SEGURIDAD INDUSTRIAL  Y PROTECION AMBIENTAL",
	"1862" : "LEGISLACION DE LA INDUSTRIA PETROLERA",
	"1863" : "RECUPERACION SECUNDARIA Y MEJORADA",
	"1864" : "TERMINACION Y MANTENIMIENTO DE POZOS",
	"1944" : "SISTEMAS ARTIFICIALES DE PRODUCCION",
	"1961" : "ADMINISTRACION INTEGRAL DE YACIMIENTOS",
	"1962" : "CONDUCCON Y MANEJO DE LA PRODUCCION DE HIDROCARBUROS",
	"1963" : "INGENIERIA DE YACIMIENTOS DE GAS",
	"1965" : "TEMAS SELECTOS INGENIERIA PETROLERA",
	"1980" : "CARACTERIZACION ESTATICA DE YACIMIENTOS",
	"1981" : "COMPORTAMIENTO DE YACIMIENTOS",
	"1982" : "FLUJO MULTIFASICO EN TUBERIAS",
	"1983" : "PRODUCTIVIDAD DE POZOS",
	"1984" : "CARACTERIZACION DINAMICA DE YACIMIENTOS",
	"1985" : "PERFORACION NO CONVENCIONAL",
	"1986" : "RECUPERACION SECUNDARIA Y MEJORADA",
	"1987" : "SISTEMAS ARTIFICIALES DE PRODUCCION",
	"1988" : "INGENIERIA DE YACIMIENTOS DE GAS",
	"1989" : "TERMINACION Y MANTENIMIENTO DE POZOS",
	"1990" : "ADMINISTRACION INTEGRAL DE YACIMIENTOS",
	"1991" : "CONDUCCION Y MANEJO DE PRODUCCION DE HIDROCARBUROS",
	"1992" : "ECONOMIA DE LOS HIDROCARBUROS",
	"2011" : "PERFORACION DE POZOS EN AGUAS PROFUNDAS",
	"2069" : "YACIMIENTOS DE GAS DE BAJA PERMEABILIDAD",
	"2081" : "EQUIPAMIENTO Y HERRAMIENTAS PARA PERFORACION DE POZOS",
	"2180" : "SIMULACION MATEMATICA DE YACIMIENTOS",
	"141" : "EXPLORACION GEOQUIMICA MINERA",
	"309" : "GEOESTADISTICA",
	"487" : "MINERALOGIA",
	"560" : "METALOGENIA",
	"920" : "YACIMIENTOS MINERALES Y MINERAGRAFIA",
	"1137" : "PETROLOGIA",
	"1466" : "PROSPECCION Y EXPLORACION MINERA",
	"1573" : "GEOQUIMICA",
	"1574" : "MINERALOGIA OPTICA",
	"1584" : "GEOESTADISTICA",
	"1642" : "MINERALOGIA OPTICA Y TECNICA",
	"1677" : "PETROLOGIA METAMORFICA",
	"1690" : "PETROLOGIA IGNEA",
	"1729" : "PETROLOGIA SEDIMENTARIA",
	"1769" : "PETROLOGIA SEDIMENTARIA",
	"1850" : "METALOGENIA",
	"1871" : "GEOLOGIA APLICADA A LA MINERIA",
	"2030" : "GEOQUIMICA APLlCADA",
	"2088" : "GEOTECNIA DE EXCAVACION",
	"189" : "ESTRATIGRAFIA",
	"320" : "GEOLOGIA DEL PETROLEO",
	"370" : "GEOLOGIA DEL SUBSUELO",
	"412" : "EXPLORACION GEOTERMICA",
	"414" : "GEOQUIMICA DEL PETROLEO",
	"824" : "SEDIMENTOLOGIA",
	"1041" : "GEOLOGIA MARINA Y CONTAMINACION",
	"1066" : "GEOLOGIA DE PETROLEO",
	"1088" : "HIDROGEOLOGIA  (se ofrece para geólogos y geofísicos)",
	"1329" : "PALEONTOLOGIA GENERAL",
	"1331" : "GEOLOGIA DE YACIMIENTOS DE FLUIDOS",
	"1440" : "GEOLOGIA Y GEOQUIMICA DEL PETROLEO",
	"1566" : "SEDIMENTOLOGIA",
	"1579" : "TECTONICA",
	"1580" : "GEOLOGIA AMBIENTAL",
	"1582" : "GEOLOGIA DEL SUBSUELO",
	"1585" : "GEOLOGIA HISTORICA",
	"1727" : "ESTRATIGRAFIA",
	"1770" : "TECTONICA",
	"1952" : "GEOLOGIA AMBIENTAL",
	"1970" : "GEOLOGIA HISTORICA Y DE MEXICO",
	"2023" : "HIDROGEOLOGIA DE CONTAMINANTES",
	"2024" : "MODELACION DEL AGUA SUBTERRANEA",
	"2089" : "HIDROGEOLOGIA DE CONTAMINANTES",
	"2092" : "MODELACION NUMERICA DE COMPORTAMIENTO DE ACUIFEROS",
	"2115" : "EXPLORACION Y EVALUACION DE AGUAS SUBTERRANEAS",
	"126" : "DISEÑO DE HERRAMENTAL",
	"130" : "DISEÑO DE ELEMENTOS DE MAQUINAS",
	"507" : "INGENIERIA DE MANUFACTURA",
	"577" : "INGENIERIA DE MATERIALES",
	"859" : "TECNOLOGIA DE MATERIALES",
	"915" : "VIBRACIONES MECANICAS",
	"971" : "DISEÑO DEL PRODUCTO",
	"972" : "DISEÑO Y MANUFACTURA ASISTIDA POR COMPUTADORA",
	"991" : "ANALISIS POR ELEMENTOS FINITOS",
	"992" : "INGENIERIA DE DISEÑO",
	"993" : "TEMAS SELECTOS DE DISEÑO I",
	"995" : "TEMAS SELECTOS DE DISEÑO II",
	"999" : "INGENIERIA DE SUPERFICIES",
	"1000" : "TEMAS SELECTOS DE MANUFACTURA",
	"1065" : "DINAMICA DE MAQUINARIA",
	"1209" : "DIBUJO MECANICO E INDUSTRIAL",
	"1225" : "MANUFACTURA I (2016)",
	"1540" : "MECANICA DE SOLIDOS",
	"1568" : "CIENCIA DE MATERIALES",
	"1570" : "INGENIERIA DE MATERIALES",
	"1659" : "MECANISMOS",
	"1660" : "METALURGIA FISICA",
	"1744" : "PROCESOS DE MANUFACTURA I",
	"1755" : "MATERIALES NO METALICOS",
	"1782" : "DISEÑO DE ELEMENTOS DE MAQUINAS",
	"1851" : "PROCESOS DE MANUFACTURA II",
	"1852" : "SEMINARIO DE INGENIERIA",
	"1859" : "MODELADO DE PROCESOS DE MANUFACTURA",
	"1956" : "PROYECTO DE INGENIERIA",
	"2072" : "TEMAS SELECTOS DE MATERIALES",
	"2165" : "SISTEMAS DE MANUFACTURA FLEXIBLE",
	"2212" : "INTRODUCCION A LA INGENIERIA MECANICA",
	"2500" : "MATERIALES II",
	"2603" : "MANUFACTURA  II",
	"2806" : "DINAMICA DE MAQUINARIA",
	"2922" : "ANALISIS POR ELEMENTOS FINITOS",
	"2924" : "MANUFACTURA III",
	"2925" : "MATERIALES III",
	"3064" : "SISTEMAS DE MANUFAC FLEXIBLE",
	"3071" : "INGENIERIA  AUTOMOTRIZ I",
	"3072" : "MANUFACTURA LEAN (ESBELTA)",
	"5126" : "LAB. DISEÑO DE HERRAMENTAL",
	"5507" : "LABORATORIO DE INGENIERIA DE MANUFACTURA",
	"5577" : "LABORATORIO DE INGENIERIA DE MATERIALES",
	"5859" : "LABORATORIO DE TECNOLOGIA DE MATERIALES",
	"5992" : "LAB. INGENIERIA DE DISEÑO",
	"6065" : "LABORATORIO DE ANALISIS DINAMICO DE MAQUINARIA",
	"6225" : "LAB. DE MANUFACTURA  I (2016)",
	"6568" : "LAB. CIENCIA DE MATERIALES",
	"6570" : "LAB INGENIERIA DE MATERIALES",
	"6660" : "LAB. METALURGIA FISICA",
	"6744" : "LAB. PROCESOS DE MANUFACTURA I",
	"6755" : "LAB. MATERIALES NO METALICOS",
	"6851" : "LAB. PROCESOS DE MANUFACTURA II",
	"6859" : "LAB. MODELADO DE PROCESOS DE MANUFACTURA",
	"7500" : "LAB MATERIALES II",
	"7603" : "LABORATORIO DE MANUFACTURA II",
	"7806" : "LABORATORIO DE DINAMICA DE MAQUINARIA",
	"7924" : "LAB. MANUFACTURA III",
	"7925" : "LAB. MATERIALES III",
	"12" : "ADMINISTRACION",
	"18" : "ADMINISTRACION",
	"143" : "DISEÑO DE SISTEMAS PRODUCTIVOS",
	"163" : "ESTADISTICA APLICADA",
	"192" : "ESTUDIO DEL TRABAJO",
	"339" : "INVESTIGACION DE OPERACIONES I",
	"619" : "PLANEACION Y CONTROL DE LA PRODUCCION",
	"818" : "SEGURIDAD INDUSTRIAL",
	"944" : "COSTOS Y EVALUACION DE PROYECTOS",
	"945" : "CREATIVIDAD",
	"946" : "CALIDAD",
	"947" : "DESARROLLO EMPRESARIAL",
	"976" : "LOGISTICA",
	"981" : "TEMAS SELECTOS DE PRODUCCION",
	"982" : "ANALlSIS FINANCIERO",
	"983" : "DESARROLLO DE HABILlDADES DIRECTIVAS",
	"984" : "ENVASE Y EMBALAJE",
	"985" : "LEGISLACION INDUSTRIAL",
	"989" : "SISTEMAS DE COMERCIALIZACION",
	"990" : "TEMAS SELECTOS DE LOGISTICA Y SISTEMAS",
	"1057" : "DESARROLLO DE HABILIDADES DIRECTIVAS",
	"1058" : "LlDERAZGO Y DIRECCION DE EMPRESAS",
	"1059" : "DESARROLLO EMPRESARIAL",
	"1060" : "ENVASE Y EMBALAJE",
	"1074" : "LEGISLACION INDUSTRIAL",
	"1087" : "SEGURIDAD INDUSTRIAL",
	"1115" : "SISTEMAS DE COMERCIALIZACION",
	"1129" : "INGENIERIA INDUSTRIAL Y PRODUCTIVIDAD",
	"1523" : "CONTABILIDAD FINANCIERA Y COSTOS",
	"1685" : "SISTEMAS DE PLANEACION",
	"1734" : "INGENIERIA ECONOMICA",
	"1745" : "RELACIONES LABORALES Y ORGANIZACIONALES",
	"1747" : "INVESTIGACION DE OPERACIONES II",
	"1784" : "ESTADISTICA APLICADA",
	"1853" : "SISTEMAS DE CALIDAD",
	"1918" : "PROCESOS INDUSTRIALES",
	"1943" : "PROCESOS INDUSTRIALES",
	"1955" : "EVALUACION DE PROYECTOS DE INVERSION",
	"2103" : "CALIDAD",
	"2602" : "CONTABILIDAD FINANCIERA Y DE COSTOS",
	"2804" : "DISEÑO DE LA CADENA DE SUMINISTROS",
	"2805" : "INSTALACIONES INDUSTRIALES",
	"2917" : "PRACTICAS PROFESIOSIONALES PARA INGENIERIA INDUSTRIAL",
	"2919" : "ANALISIS Y MEJORADO DE PROCESOS",
	"2920" : "DIRECCION DE PROYECTOS",
	"2921" : "SIMULACION",
	"3020" : "CREATIVIDAD E INOVACION",
	"3021" : "METODOLOGIA PARA LA PLANEACION",
	"3022" : "RELACION LABORAL Y ORGANIZA",
	"3065" : "COSTOS Y LOGISTICA DE SISTEMAS DE TRANSPORTE",
	"3066" : "INTELIGENCIA DE NEGOCIOS",
	"3070" : "ERGONOMIA EN EL TRABAJO",
	"3073" : "COMERCIO INTERNACIONAL",
	"3075" : "TEMAS SELECTOS DE PRODUCCION Y MANUFACTURA",
	"3076" : "FINANZAS COORPORATIVAS",
	"3077" : "TEMAS SELECTOS DE DIRECCION DE CREACION DE EMPRESAS",
	"181" : "ELECTRONICA BASICA",
	"391" : "INSTALACIONES ELECTROMECANICAS",
	"508" : "MODELADO DE SISTEMAS FISICOS",
	"510" : "INSTRUMENTACION",
	"513" : "TECNICAS DE PROGRAMACION",
	"526" : "CIRCUITOS DIGITALES",
	"549" : "MAQUINAS ELECTRICAS",
	"551" : "CONTROL AUTOMATICO",
	"563" : "DISEÑO MECATRONICO",
	"572" : "AUTOMATIZACION INDUSTRIAL",
	"574" : "INTRODUCCION A SISTEMAS NO LINEALES",
	"605" : "TEMAS SELECTOS DE PROGRAMACION",
	"980" : "SISTEMAS DE PRODUCCION AVANZADOS",
	"1408" : "SISTEMAS ELECTROMECANICOS",
	"1472" : "TECNICAS DE PROGRAMACION",
	"1550" : "ANALISIS DE CIRCUITOS",
	"1691" : "ELECTRONICA BASICA",
	"1807" : "INSTRUMENTACION Y CONTROL",
	"1964" : "TEMAS SELECTOS DE PROGRAMACION I",
	"1973" : "SISTEMAS ELECTRONICOS LINEALES",
	"1996" : "CIRCUITOS DIGITALES",
	"2135" : "ROBOTICA",
	"2171" : "SISTEMAS ELECTRONICOS LINEALES",
	"2172" : "TEMAS SELECTOS DE MECATRONICA",
	"3074" : "SISTEMAS DE PRODUCCION AVANZADOS",
	"3089" : "TEMAS SELECTOS DE MECATRONICA I",
	"3090" : "TEMAS SELECTOS DE MECATRONICA II",
	"3098" : "TEMAS SEL DE PROGRAMACION II",
	"934" : "ERGONOMIA",
	"1009" : "BIOMECANICA",
	"1320" : "BIOQUIMICA (2016)",
	"1571" : "INTRODUCCION A LA  ANATOMIA Y FISIOLOGIA I",
	"1695" : "ANALISIS DE BIOSEÑALES",
	"1698" : "MEDICIONES CLINICAS",
	"1699" : "SISTEMAS DE MEDICION TRANSDUCTORES MEDICOS",
	"1778" : "MECANICA DEL CUERPO HUMANO",
	"1779" : "PSICOLOGIA MEDICA",
	"1781" : "BIOTERMOFLUIDOS I",
	"1783" : "ERGONOMIA",
	"1786" : "PLANEACION Y CONTROL DE RECURSOS HOSPITALARIOS",
	"1787" : "AMPLIFICACION Y FILTRADO DE SEÑALES MEDICAS",
	"1798" : "TEM SELEC ING SIST BIOMEDICOS II",
	"1799" : "TEM SELEC ING SISTBIOMEDICOS III",
	"1895" : "ASPECTOS LEGALES Y ORGANZACIONALES ATENCION MEDICA",
	"1897" : "TEM SELEC ING SIST BIOMEDICOS IV",
	"1898" : "TEM SELEC ING SIST BIOMEDICOS V",
	"1899" : "TEM SELEC ING SIST BIOMEDICOS VI",
	"1976" : "ESTANCIA",
	"2079" : "BIOMATERIALES",
	"21" : "AIRE ACONDICIONADO Y REFRIGERACION",
	"354" : "INGENIERIA DE PROCESOS INDUSTRIALES",
	"440" : "LABORATORIO DE MAQUINAS TERMICAS",
	"462" : "MECANICA DE FLUIDOS I",
	"536" : "MECANICA DE FLUIDOS II",
	"547" : "MAQUINAS DE DESPLAZAMIENTO POSITIVO",
	"628" : "PLANTAS TERMOELECTRICAS",
	"900" : "TURBOMAQUINARIA",
	"901" : "TERMODINAMICA APLICADA",
	"1409" : "TERMOFLUIDOS",
	"1521" : "ELEMENTOS DE MECANICA DEL MEDIO CONTINUO",
	"1756" : "MECANICA DE FLUIDOS II",
	"1860" : "TRANSFERENCIA DE CALOR",
	"2074" : "DISEÑO DE SISTEMAS TERMICOS",
	"2076" : "MAQUINAS DE DESPLAZAMIENTO POSITIVO",
	"2077" : "TEMAS SELECTOS DE TERMOFLUIDOS I",
	"2078" : "TEMAS SELECTOS DE TERMOFLUIDOS II",
	"2137" : "SISTEMAS DE MEJORAMIENTO AMBIENTAL",
	"2501" : "SISTEMAS DE CONVERSION DE ENERGIA TERMICA",
	"2926" : "SISTEMAS TERMOENERGETICOS",
	"3081" : "PLANTAS TERMOELECTRICAS Y SISTEMAS DE COGENERACION",
	"5021" : "LABORATORIO DE  AIRE ACONDICONADO Y REFRIGERACION",
	"5462" : "LAB. MECANICA DE FLUIDOS I",
	"5536" : "LAB. MECANICA DE FLUIDOS II",
	"6409" : "LABORATORIO DE TERMOFLUIDOS",
	"6756" : "LAB. MECANICA DE FLUIDOS II",
	"6860" : "LAB. TRANSFERENCA DE CALOR",
	"234" : "EDIFICACION",
	"1407" : "RECURSOS DE LA CONSTRUCCION",
	"1444" : "PROCEDIMIENTOS CONTRUCTIVOS DE ELEMENTOS ESTRUCT",
	"1596" : "PROGRAMACION Y PRESUPUESTO",
	"1608" : "MOVIMIENTO DE TIERRAS",
	"1760" : "ADMINISTRACION EN INGENIERIA",
	"387" : "INGENIERIA DE SISTEMAS I",
	"642" : "PLANEACION",
	"781" : "SISTEMAS DE TRANSPORTE",
	"1667" : "INGENIERIA DE SISTEMAS",
	"1731" : "INGENIERIA DE SISTEMAS II",
	"1966" : "INTEGRACION DE PROYECTOS",
	"2156" : "EVALUACION DE PROYECTOS",
	"2803" : "INGENIERIA DE TRANSITO",
	"2913" : "INGENIERIA DEL TRANSPORTE I",
	"230" : "DISEÑO ESTRUCTURAL",
	"275" : "ESTRUCTURAS ISOSTATICAS",
	"465" : "MECANICA DE MATERIALES I",
	"466" : "MECANICA DE MATERIALES II",
	"1703" : "ANALISIS ESTRUCTURAL",
	"2062" : "PROYECTO ESTRUCTURAL PARA EDIFICACIONES DE CONCRETO Y MAMPOSTERIA",
	"2063" : "PROYECTO DE ESTRUCTURAS METALICAS",
	"2801" : "DIMENSIONAMIENTO DE  ELEMENTOS  ESTRUCTURALES",
	"1334" : "FOTOGRAMETRIA",
	"1449" : "PROCESOS FOTOGRAMETRICOS",
	"1534" : "INTRODUCCION A  BASES DE DATOS ESPACIALES",
	"1648" : "GESTION AMBIENTAL",
	"1652" : "SISTEMAS DE INFORMACION GEOGRAFICA I",
	"1689" : "PERCEPCION REMOTA I",
	"1752" : "PERCEPCION REMOTA II",
	"1753" : "SISTEMAS DE INFORMACION GEOGRAFICA II",
	"1854" : "PROYECTO GEOMATICO",
	"2936" : "CARTOGRAFIA DIGITAL",
	"1417" : "FUNDAMENTOS DE GEODESIA",
	"1448" : "GEODESIA I",
	"1533" : "GEODESIA II",
	"1541" : "GEODESIA",
	"1542" : "GEOLOGIA Y GEOMORFOLOGIA",
	"1543" : "MODELACION MATEMATICA",
	"1544" : "SISTEMA POSICIONAMIENTO GLOBAL (GPS)",
	"1545" : "TEORIA DE LOS ERRORES I",
	"1548" : "CALCULO DE AJUSTES",
	"1581" : "HIDRAULICA E HIDROLOGIA",
	"1599" : "FUNDAMENTOS DE CATASTRO",
	"1637" : "TEORIA DE LOS ERRORES",
	"1646" : "GEODESIA III",
	"1647" : "SISTEMAS DE POSICION GLOBAL",
	"1653" : "TEORIA DE LOS ERRORES II",
	"1750" : "CARTOGRAFIA",
	"1751" : "HIDROLOGIA APLICADA A LA GEOMATICA",
	"2065" : "AUTOMATIZACION DE PROCESOS CARTOGRAFICOS",
	"2938" : "GEOMATICA APLICADA AL TRANSP",
	"2939" : "METODOS GEOFISICOS",
	"2942" : "TOPOGRAFIA APLICADA A LA CONSTRUCCION DE EDIFICIOS",
	"152" : "CIMENTACIONES",
	"1506" : "GEOLOGIA",
	"1555" : "FUND. DE MECANICA DEL MEDIO CONTINUO",
	"1601" : "COMPORTAMIENTO DE SUELOS",
	"1714" : "MECANICA DE SUELOS",
	"2060" : "ESTRUCTURAS DE PAVIMENTOS",
	"379" : "HIDROLOGIA",
	"610" : "OBRAS HIDRAULICAS",
	"1402" : "HIDRAULICA BASICA",
	"1507" : "HIDRAULICA DE CANALES",
	"1730" : "HIDRAULICA DE MAQUINAS Y TRANSITORIOS",
	"2061" : "HIDRAULICA URBANA",
	"2600" : "ESTADISTICA APLICADA A INGENIERIA CIVIL",
	"32" : "ABASTECIMIENTO  DE AGUA POTABLE",
	"1595" : "INGENIERIA AMBIENTAL I",
	"1761" : "IMPACTO AMBIENTAL Y MANEJO DE RESIDUOS MUNICIPALES",
	"1832" : "ABASTECIMIENTO DE AGUA POTABLE Y ALCANTARILLADO",
	"1935" : "TRATAMIENTO DE AGUAS RESIDUALES",
	"2601" : "INGENIERIA AMBIENTAL II",
	"2800" : "ALCANTARILLADO SANITARIO Y PLUVIAL",
	"1110" : "PRACTICAS DE TOPOGRAFIA  (2016)",
	"1114" : "TOPOGRAFIA I  (2016)",
	"1217" : "PRACTICAS DE TOPOGRAFIA II",
	"1218" : "TOPOGRAFIA II",
	"1229" : "GEOMATICA BASICA",
	"1510" : "LEGISLACION TOPOGRAFICA",
	"1649" : "LEGISLACION APLIC ING GEOMAT",
	"1679" : "PROYECTO GEOMETRICO DE OBRAS INFRAESTRUCTURA",
	"1880" : "PRACTICAS GENERALES",
	"1884" : "TOPOGRAFIA III",
	"1947" : "ADMINISTRACION DE PROYECTOS",
	"1960" : "PRACTICAS PROFESIONALES",
	"2066" : "CATASTRO",
	"2068" : "HIDROGRAFIA",
	"2070" : "TOPOGRAFIA DE YACIMIENTOS MINERALES"]
