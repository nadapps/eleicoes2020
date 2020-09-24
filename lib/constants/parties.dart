const parties = [
  {
    "id": "1",
    "initials": "MDB",
    "name": "MOVIMENTO DEMOCRÁTICO BRASILEIRO",
    "PRES. NACIONAL": "LUIZ FELIPE BALEIA TENUTO ROSSI",
    "number": 15,
    "color": 0xff00A550,
    "image": "assets/parties/mdb.jpg"
  },
  {
    "id": "2",
    "initials": "PTB",
    "name": "PARTIDO TRABALHISTA BRASILEIRO",
    "PRES. NACIONAL": "ROBERTO JEFFERSON MONTEIRO FRANCISCO",
    "number": 14,
    "color": 0xfff5a31c,
    "image": "assets/parties/ptb.jpg"
  },
  {
    "id": "3",
    "initials": "PDT",
    "name": "PARTIDO DEMOCRÁTICO TRABALHISTA",
    "PRES. NACIONAL": "CARLOS LUPI",
    "number": 12,
    "color": 0xffAA2222,
    "image": "assets/parties/pdt.jpg"
  },
  {
    "id": "4",
    "initials": "PT",
    "name": "PARTIDO DOS TRABALHADORES",
    "PRES. NACIONAL": "GLEISI HELENA HOFFMANN",
    "number": 13,
    "color": 0xffC91216,
    "image": "assets/parties/pt.jpg"
  },
  {
    "id": "5",
    "initials": "DEM",
    "name": "DEMOCRATAS",
    "PRES. NACIONAL": "ANTÔNIO CARLOS MAGALHÃES NETO",
    "number": 25,
    "color": 0xff0A2327,
    "image": "assets/parties/dem.jpg"
  },
  {
    "id": "6",
    "initials": "PCdoB",
    "name": "PARTIDO COMUNISTA DO BRASIL",
    "PRES. NACIONAL": "LUCIANA BARBOSA DE OLIVEIRA SANTOS",
    "number": 65,
    "color": 0xffE02323,
    "image": "assets/parties/pcdob.jpg"
  },
  {
    "id": "7",
    "initials": "PSB",
    "name": "PARTIDO SOCIALISTA BRASILEIRO",
    "PRES. NACIONAL": "CARLOS ROBERTO SIQUEIRA DE BARROS",
    "number": 40,
    "color": 0xffFFB400,
    "image": "assets/parties/psb.jpg"
  },
  {
    "id": "8",
    "initials": "PSDB",
    "name": "PARTIDO DA SOCIAL DEMOCRACIA BRASILEIRA",
    "PRES. NACIONAL": "BRUNO CAVALCANTI DE ARAÚJO",
    "number": 45,
    "color": 0xff004997,
    "image": "assets/parties/psdb.jpg"
  },
  {
    "id": "9",
    "initials": "PTC",
    "name": "PARTIDO TRABALHISTA CRISTÃO",
    "PRES. NACIONAL": "DANIEL S. TOURINHO",
    "number": 36,
    "color": 0xff0263A8,
    "image": "assets/parties/ptc.jpg"
  },
  {
    "id": "10",
    "initials": "PSC",
    "name": "PARTIDO SOCIAL CRISTÃO",
    "PRES. NACIONAL": "EVERALDO DIAS PEREIRA",
    "number": 20,
    "color": 0xff009241,
    "image": "assets/parties/psc.jpg"
  },
  {
    "id": "11",
    "initials": "PMN",
    "name": "PARTIDO DA MOBILIZAÇÃO NACIONAL",
    "PRES. NACIONAL": "ANTONIO CARLOS BOSCO MASSAROLLO",
    "number": 33,
    "color": 0xffE02323,
    "image": "assets/parties/pmn.jpg"
  },
  {
    "id": "12",
    "initials": "CIDADANIA",
    "name": "CIDADANIA",
    "PRES. NACIONAL": "ROBERTO JOÃO PEREIRA FREIRE",
    "number": 23,
    "color": 0xffEC018C,
    "image": "assets/parties/cidadania.jpg"
  },
  {
    "id": "13",
    "initials": "PV",
    "name": "PARTIDO VERDE",
    "PRES. NACIONAL": "JOSÉ LUIZ DE FRANÇA PENNA",
    "number": 43,
    "color": 0xff0E3604,
    "image": "assets/parties/pv.jpg"
  },
  {
    "id": "14",
    "initials": "AVANTE",
    "name": "AVANTE",
    "PRES. NACIONAL": "LUIS HENRIQUE DE OLIVEIRA RESENDE",
    "number": 70,
    "color": 0xff1DAAB1,
    "image": "assets/parties/avante.jpg"
  },
  {
    "id": "15",
    "initials": "PP",
    "name": "PROGRESSISTAS",
    "PRES. NACIONAL": "CIRO NOGUEIRA LIMA FILHO",
    "number": 11,
    "color": 0xff2E4E77,
    "image": "assets/parties/pp.jpg"
  },
  {
    "id": "16",
    "initials": "PSTU",
    "name": "PARTIDO SOCIALISTA DOS TRABALHADORES UNIFICADO",
    "PRES. NACIONAL": "JOSÉ MARIA DE ALMEIDA",
    "number": 16,
    "color": 0xffE02323,
    "image": "assets/parties/pstu.jpg"
  },
  {
    "id": "17",
    "initials": "PCB",
    "name": "PARTIDO COMUNISTA BRASILEIRO",
    "PRES. NACIONAL": "EDMILSON SILVA COSTA*",
    "number": 21,
    "color": 0xffE02323,
    "image": "assets/parties/pcb.jpg"
  },
  {
    "id": "18",
    "initials": "PRTB",
    "name": "PARTIDO RENOVADOR TRABALHISTA BRASILEIRO",
    "PRES. NACIONAL": "JOSÉ LEVY FIDELIX DA CRUZ",
    "number": 28,
    "color": 0xff040097,
    "image": "assets/parties/prtb.jpg"
  },
  {
    "id": "19",
    "initials": "DC",
    "name": "DEMOCRACIA CRISTÃ",
    "PRES. NACIONAL": "JOSÉ MARIA EYMAEL",
    "number": 27,
    "color": 0xff005E9A,
    "image": "assets/parties/dc.jpg"
  },
  {
    "id": "20",
    "initials": "PCO",
    "name": "PARTIDO DA CAUSA OPERÁRIA",
    "PRES. NACIONAL": "RUI COSTA PIMENTA",
    "number": 29,
    "color": 0xffE02323,
    "image": "assets/parties/pco.jpg"
  },
  {
    "id": "21",
    "initials": "PODE",
    "name": "PODEMOS",
    "PRES. NACIONAL": "RENATA HELLMEISTER DE ABREU",
    "number": 19,
    "color": 0xff3684C6,
    "image": "assets/parties/pode.jpg"
  },
  {
    "id": "22",
    "initials": "PSL",
    "name": "PARTIDO SOCIAL LIBERAL",
    "PRES. NACIONAL": "LUCIANO CALDAS BIVAR",
    "number": 17,
    "color": 0xff193769,
    "image": "assets/parties/psl.jpg"
  },
  {
    "id": "23",
    "initials": "REPUBLICANOS",
    "name": "REPUBLICANOS",
    "PRES. NACIONAL": "MARCOS ANTONIO PEREIRA",
    "number": 10,
    "color": 0xffF8C220,
    "image": "assets/parties/republicanos.jpg"
  },
  {
    "id": "24",
    "initials": "PSOL",
    "name": "PARTIDO SOCIALISMO E LIBERDADE",
    "PRES. NACIONAL": "JULIANO MEDEIROS",
    "number": 50,
    "color": 0xffC91216,
    "image": "assets/parties/psol.jpg"
  },
  {
    "id": "25",
    "initials": "PL",
    "name": "PARTIDO LIBERAL",
    "PRES. NACIONAL": "JOSÉ TADEU CANDELÁRIA",
    "number": 22,
    "color": 0xff250087,
    "image": "assets/parties/pl.jpg"
  },
  {
    "id": "26",
    "initials": "PSD",
    "name": "PARTIDO SOCIAL DEMOCRÁTICO",
    "PRES. NACIONAL": "GILBERTO KASSAB",
    "number": 55,
    "color": 0xff244890,
    "image": "assets/parties/psd.jpg"
  },
  {
    "id": "27",
    "initials": "PATRIOTA",
    "name": "PATRIOTA",
    "PRES. NACIONAL": "ADILSON BARROSO OLIVEIRA",
    "number": 51,
    "color": 0xff3B5998,
    "image": "assets/parties/patriota.jpg"
  },
  {
    "id": "28",
    "initials": "PROS",
    "name": "PARTIDO REPUBLICANO DA ORDEM SOCIAL",
    "PRES. NACIONAL": "EURÍPEDES G.DE MACEDO JÚNIOR",
    "number": 90,
    "color": 0xffF79020,
    "image": "assets/parties/pros.jpg"
  },
  {
    "id": "29",
    "initials": "SOLIDARIEDADE",
    "name": "SOLIDARIEDADE",
    "PRES. NACIONAL": "PAULO PEREIRA DA SILVA",
    "number": 77,
    "color": 0xff1E1848,
    "image": "assets/parties/solidariedade.jpg"
  },
  {
    "id": "30",
    "initials": "NOVO",
    "name": "PARTIDO NOVO",
    "PRES. NACIONAL": "EDUARDO RODRIGO FERNANDES RIBEIRO",
    "number": 30,
    "color": 0xffFF830D,
    "image": "assets/parties/novo.jpg"
  },
  {
    "id": "31",
    "initials": "REDE",
    "name": "REDE SUSTENTABILIDADE",
    "PRES. NACIONAL": "PEDRO IVO DE SOUZA BATISTA",
    "number": 18,
    "color": 0xffFC6C30,
    "image": "assets/parties/rede.jpg"
  },
  {
    "id": "32",
    "initials": "PMB",
    "name": "PARTIDO DA MULHER BRASILEIRA",
    "PRES. NACIONAL": "SUÊD HAIDAR NOGUEIRA",
    "number": 35,
    "color": 0xff046E9E,
    "image": "assets/parties/pmb.jpg"
  },
  {
    "id": "33",
    "initials": "UP",
    "name": "UNIDADE POPULAR",
    "PRES. NACIONAL": "LEONARDO PERICLES VIEIRA ROQUE",
    "number": 80,
    "color": 0xff363A40,
    "image": "assets/parties/up.jpg"
  },
];
