const Map<String, Map<String, dynamic>> appFunctions = {
  "TSKT MTM GẠO": {
    "icon": "assets/icons/icons8-rice.svg",
    "description": "Technical specifications for rice milling machines.",
    "path": "/riceDetails",
  },
  "THIẾT BỊ PHỤ TRỢ": {
    "icon": "assets/icons/icons8-equipment.svg",
    "description": "Details about auxiliary equipment.",
    "path": "/equipmentDetails",
  },
  "CHI PHÍ ĐẦU TƯ": {
    "icon": "assets/icons/icons8-investment.svg",
    "description": "Investment cost information.",
    "path": "/investmentDetails",
  },
};

const List<String> TSKTMTTGAO = [
  "MODEL SC",
  "MODEL SF",
];

const Map<String, List<Map<String, dynamic>>> phutroList = {
  "TBP LẮP 1 MÁY": [
    {
      "model": "SC16Pro, SC16, SF768",
      "image": "assets/phutro/tbp1may/SC16Pro,SC16,SF768.png",
    },
    {
      "model": "SC12, SF640",
      "image": "assets/phutro/tbp1may/SC12,SF640.png",
    },
    {
      "model": "SC10, SF448",
      "image": "assets/phutro/tbp1may/SC10,SF448.png",
    },
    {
      "model": "SC8, SF320",
      "image": "assets/phutro/tbp1may/SC8,SF320.png",
    },
    {
      "model": "SC4, SF192",
      "image": "assets/phutro/tbp1may/SC4,SF192.png",
    }
  ],
  "TBP LẮP 2 MÁY ĐỐI ĐẦU": [
    {
      "model": "SC16Pro, SC16, SF768",
      "image": "assets/phutro/tbp2maylapdau/SC16Pro,SC16,SF768.png",
    },
    {
      "model": "SC12, SF640",
      "image": "assets/phutro/tbp2maylapdau/SC12,SF640.png",
    },
    {
      "model": "SC10, SF448",
      "image": "assets/phutro/tbp2maylapdau/SC10,SF448.png",
    }
  ],
  "TBP LẮP 2 MÁY NỐI TIẾP": [
    {
      "model": "SC16Pro, SC16, SF768",
      "image": "assets/phutro/tbp2maylapnoitiep/SC16Pro,SC16,SF768.png",
    },
    {
      "model": "SC12, SF640",
      "image": "assets/phutro/tbp2maylapnoitiep/SC12,SF640.png",
    },
    {
      "model": "SC10, SF448",
      "image": "assets/phutro/tbp2maylapnoitiep/SC10,SF448.png",
    }
  ]
};
