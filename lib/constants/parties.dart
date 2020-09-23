const parties = [
  {
    "id": "1",
    "initials": "MDB",
    "name": "MOVIMENTO DEMOCRÁTICO BRASILEIRO",
    "PRES. NACIONAL": "LUIZ FELIPE BALEIA TENUTO ROSSI",
    "number": 15,
    "color": "00A550",
    "image": "assets/partidos/mdb.jpg"
  },
  {
    "id": "2",
    "initials": "PTB",
    "name": "PARTIDO TRABALHISTA BRASILEIRO",
    "PRES. NACIONAL": "ROBERTO JEFFERSON MONTEIRO FRANCISCO",
    "number": 14,
    "color": "f5a31c",
    "image": "assets/partidos/ptb.jpg"
  },
  {
    "id": "3",
    "initials": "PDT",
    "name": "PARTIDO DEMOCRÁTICO TRABALHISTA",
    "PRES. NACIONAL": "CARLOS LUPI",
    "number": 12,
    "color": "AA2222",
    "image": "assets/partidos/pdt.jpg"
  },
  {
    "id": "4",
    "initials": "PT",
    "name": "PARTIDO DOS TRABALHADORES",
    "PRES. NACIONAL": "GLEISI HELENA HOFFMANN",
    "number": 13,
    "color": "C91216",
    "image": "assets/partidos/pt.jpg"
  },
  {
    "id": "5",
    "initials": "DEM",
    "name": "DEMOCRATAS",
    "PRES. NACIONAL": "ANTÔNIO CARLOS MAGALHÃES NETO",
    "number": 25,
    "color": "0A2327",
    "image": "assets/partidos/dem.jpg"
  },
  {
    "id": "6",
    "initials": "PCdoB",
    "name": "PARTIDO COMUNISTA DO BRASIL",
    "PRES. NACIONAL": "LUCIANA BARBOSA DE OLIVEIRA SANTOS",
    "number": 65,
    "color": "E02323",
    "image": "assets/partidos/pcdob.jpg"
  },
  {
    "id": "7",
    "initials": "PSB",
    "name": "PARTIDO SOCIALISTA BRASILEIRO",
    "PRES. NACIONAL": "CARLOS ROBERTO SIQUEIRA DE BARROS",
    "number": 40,
    "color": "E02323",
    "image": "assets/partidos/psb.jpg"
  },
  {
    "id": "8",
    "initials": "PSDB",
    "name": "PARTIDO DA SOCIAL DEMOCRACIA BRASILEIRA",
    "PRES. NACIONAL": "BRUNO CAVALCANTI DE ARAÚJO",
    "number": 45,
    "color": "004997",
    "image": "assets/partidos/psdb.jpg"
  },
  {
    "id": "9",
    "initials": "PTC",
    "name": "PARTIDO TRABALHISTA CRISTÃO",
    "PRES. NACIONAL": "DANIEL S. TOURINHO",
    "number": 36,
    "color": "0263A8",
    "image": "assets/partidos/ptc.jpg"
  },
  {
    "id": "10",
    "initials": "PSC",
    "name": "PARTIDO SOCIAL CRISTÃO",
    "PRES. NACIONAL": "EVERALDO DIAS PEREIRA",
    "number": 20,
    "color": "009241",
    "image": "assets/partidos/psc.jpg"
  },
  {
    "id": "11",
    "initials": "PMN",
    "name": "PARTIDO DA MOBILIZAÇÃO NACIONAL",
    "PRES. NACIONAL": "ANTONIO CARLOS BOSCO MASSAROLLO",
    "number": 33,
    "color": "E02323",
    "image": "assets/partidos/pmn.jpg"
  },
  {
    "id": "12",
    "initials": "CIDADANIA",
    "name": "CIDADANIA",
    "PRES. NACIONAL": "ROBERTO JOÃO PEREIRA FREIRE",
    "number": 23,
    "color": "EC018C",
    "image": "assets/partidos/cidadania.jpg"
  },
  {
    "id": "13",
    "initials": "PV",
    "name": "PARTIDO VERDE",
    "PRES. NACIONAL": "JOSÉ LUIZ DE FRANÇA PENNA",
    "number": 43,
    "color": "0E3604",
    "image": "assets/partidos/pv.jpg"
  },
  {
    "id": "14",
    "initials": "AVANTE",
    "name": "AVANTE",
    "PRES. NACIONAL": "LUIS HENRIQUE DE OLIVEIRA RESENDE",
    "number": 70,
    "color": "1DAAB1",
    "image": "assets/partidos/avante.jpg"
  },
  {
    "id": "15",
    "initials": "PP",
    "name": "PROGRESSISTAS",
    "PRES. NACIONAL": "CIRO NOGUEIRA LIMA FILHO",
    "number": 11,
    "color": "2E4E77",
    "image": "assets/partidos/pp.jpg"
  },
  {
    "id": "16",
    "initials": "PSTU",
    "name": "PARTIDO SOCIALISTA DOS TRABALHADORES UNIFICADO",
    "PRES. NACIONAL": "JOSÉ MARIA DE ALMEIDA",
    "number": 16,
    "color": "E02323",
    "image": "assets/partidos/pstu.jpg"
  },
  {
    "id": "17",
    "initials": "PCB",
    "name": "PARTIDO COMUNISTA BRASILEIRO",
    "PRES. NACIONAL": "EDMILSON SILVA COSTA*",
    "number": 21,
    "color": "E02323",
    "image": "assets/partidos/pcb.jpg"
  },
  {
    "id": "18",
    "initials": "PRTB",
    "name": "PARTIDO RENOVADOR TRABALHISTA BRASILEIRO",
    "PRES. NACIONAL": "JOSÉ LEVY FIDELIX DA CRUZ",
    "number": 28,
    "color": "040097",
    "image": "assets/partidos/prtb.jpg"
  },
  {
    "id": "19",
    "initials": "DC",
    "name": "DEMOCRACIA CRISTÃ",
    "PRES. NACIONAL": "JOSÉ MARIA EYMAEL",
    "number": 27,
    "color": "005E9A",
    "image": "assets/partidos/dc.jpg"
  },
  {
    "id": "20",
    "initials": "PCO",
    "name": "PARTIDO DA CAUSA OPERÁRIA",
    "PRES. NACIONAL": "RUI COSTA PIMENTA",
    "number": 29,
    "color": "E02323",
    "image": "assets/partidos/pco.jpg"
  },
  {
    "id": "21",
    "initials": "PODE",
    "name": "PODEMOS",
    "PRES. NACIONAL": "RENATA HELLMEISTER DE ABREU",
    "number": 19,
    "color": "3684C6",
    "image": "assets/partidos/pode.jpg"
  },
  {
    "id": "22",
    "initials": "PSL",
    "name": "PARTIDO SOCIAL LIBERAL",
    "PRES. NACIONAL": "LUCIANO CALDAS BIVAR",
    "number": 17,
    "color": "193769",
    "image": "assets/partidos/psl.jpg"
  },
  {
    "id": "23",
    "initials": "REPUBLICANOS",
    "name": "REPUBLICANOS",
    "PRES. NACIONAL": "MARCOS ANTONIO PEREIRA",
    "number": 10,
    "color": "F8C220",
    "image": "assets/partidos/republicanos.jpg"
  },
  {
    "id": "24",
    "initials": "PSOL",
    "name": "PARTIDO SOCIALISMO E LIBERDADE",
    "PRES. NACIONAL": "JULIANO MEDEIROS",
    "number": 50,
    "color": "C91216",
    "image": "assets/partidos/psol.jpg"
  },
  {
    "id": "25",
    "initials": "PL",
    "name": "PARTIDO LIBERAL",
    "PRES. NACIONAL": "JOSÉ TADEU CANDELÁRIA",
    "number": 22,
    "color": "250087",
    "image": "assets/partidos/pl.jpg"
  },
  {
    "id": "26",
    "initials": "PSD",
    "name": "PARTIDO SOCIAL DEMOCRÁTICO",
    "PRES. NACIONAL": "GILBERTO KASSAB",
    "number": 55,
    "color": "244890",
    "image": "assets/partidos/psd.jpg"
  },
  {
    "id": "27",
    "initials": "PATRIOTA",
    "name": "PATRIOTA",
    "PRES. NACIONAL": "ADILSON BARROSO OLIVEIRA",
    "number": 51,
    "color": "3B5998",
    "image": "assets/partidos/patriota.jpg"
  },
  {
    "id": "28",
    "initials": "PROS",
    "name": "PARTIDO REPUBLICANO DA ORDEM SOCIAL",
    "PRES. NACIONAL": "EURÍPEDES G.DE MACEDO JÚNIOR",
    "number": 90,
    "color": "F79020",
    "image": "assets/partidos/pros.jpg"
  },
  {
    "id": "29",
    "initials": "SOLIDARIEDADE",
    "name": "SOLIDARIEDADE",
    "PRES. NACIONAL": "PAULO PEREIRA DA SILVA",
    "number": 77,
    "color": "1E1848",
    "image": "assets/partidos/solidariedade.jpg"
  },
  {
    "id": "30",
    "initials": "NOVO",
    "name": "PARTIDO NOVO",
    "PRES. NACIONAL": "EDUARDO RODRIGO FERNANDES RIBEIRO",
    "number": 30,
    "color": "FF830D",
    "image": "assets/partidos/solidariedade.jpg"
  },
  {
    "id": "31",
    "initials": "REDE",
    "name": "REDE SUSTENTABILIDADE",
    "PRES. NACIONAL": "PEDRO IVO DE SOUZA BATISTA",
    "number": 18,
    "color": "FC6C30",
    "image": "assets/partidos/rede.jpg"
  },
  {
    "id": "32",
    "initials": "PMB",
    "name": "PARTIDO DA MULHER BRASILEIRA",
    "PRES. NACIONAL": "SUÊD HAIDAR NOGUEIRA",
    "number": 35,
    "color": "046E9E",
    "image": "assets/partidos/pmb.jpg"
  },
  {
    "id": "33",
    "initials": "UP",
    "name": "UNIDADE POPULAR",
    "PRES. NACIONAL": "LEONARDO PERICLES VIEIRA ROQUE",
    "number": 80,
    "color": "363A40",
    "image": "assets/partidos/up.jpg"
  },
];
