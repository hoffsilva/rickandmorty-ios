//
//  Constants.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 07/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

struct Constants {
    
    private init() {}
    
    struct URL {
        private init() {}
        static let base = "https://rickandmortyapi.com/api/"
    }
    
    struct Path {
        private init() {}
        static let character = "character"
        static let location = "location"
    }
    
    struct Parameter {
        private init() {}
        static let name = "name"
        static let page = "page"
    }
    
    struct SampleData {
        private init() {}
        
        static let detailLocationWithIDTwenty = """
            {"id":20,"name":"Earth (Replacement Dimension)","type":"Planet","dimension":"Replacement Dimension","residents":["https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/2","https://rickandmortyapi.com/api/character/3","https://rickandmortyapi.com/api/character/4","https://rickandmortyapi.com/api/character/5","https://rickandmortyapi.com/api/character/9","https://rickandmortyapi.com/api/character/11","https://rickandmortyapi.com/api/character/13","https://rickandmortyapi.com/api/character/16","https://rickandmortyapi.com/api/character/31","https://rickandmortyapi.com/api/character/32","https://rickandmortyapi.com/api/character/50","https://rickandmortyapi.com/api/character/58","https://rickandmortyapi.com/api/character/59","https://rickandmortyapi.com/api/character/64","https://rickandmortyapi.com/api/character/66","https://rickandmortyapi.com/api/character/76","https://rickandmortyapi.com/api/character/88","https://rickandmortyapi.com/api/character/103","https://rickandmortyapi.com/api/character/107","https://rickandmortyapi.com/api/character/109","https://rickandmortyapi.com/api/character/113","https://rickandmortyapi.com/api/character/115","https://rickandmortyapi.com/api/character/124","https://rickandmortyapi.com/api/character/128","https://rickandmortyapi.com/api/character/137","https://rickandmortyapi.com/api/character/138","https://rickandmortyapi.com/api/character/141","https://rickandmortyapi.com/api/character/147","https://rickandmortyapi.com/api/character/149","https://rickandmortyapi.com/api/character/151","https://rickandmortyapi.com/api/character/154","https://rickandmortyapi.com/api/character/166","https://rickandmortyapi.com/api/character/167","https://rickandmortyapi.com/api/character/170","https://rickandmortyapi.com/api/character/171","https://rickandmortyapi.com/api/character/172","https://rickandmortyapi.com/api/character/180","https://rickandmortyapi.com/api/character/181","https://rickandmortyapi.com/api/character/182","https://rickandmortyapi.com/api/character/185","https://rickandmortyapi.com/api/character/189","https://rickandmortyapi.com/api/character/190","https://rickandmortyapi.com/api/character/210","https://rickandmortyapi.com/api/character/217","https://rickandmortyapi.com/api/character/218","https://rickandmortyapi.com/api/character/219","https://rickandmortyapi.com/api/character/227","https://rickandmortyapi.com/api/character/230","https://rickandmortyapi.com/api/character/233","https://rickandmortyapi.com/api/character/234","https://rickandmortyapi.com/api/character/236","https://rickandmortyapi.com/api/character/237","https://rickandmortyapi.com/api/character/240","https://rickandmortyapi.com/api/character/241","https://rickandmortyapi.com/api/character/243","https://rickandmortyapi.com/api/character/245","https://rickandmortyapi.com/api/character/248","https://rickandmortyapi.com/api/character/251","https://rickandmortyapi.com/api/character/255","https://rickandmortyapi.com/api/character/259","https://rickandmortyapi.com/api/character/262","https://rickandmortyapi.com/api/character/265","https://rickandmortyapi.com/api/character/272","https://rickandmortyapi.com/api/character/276","https://rickandmortyapi.com/api/character/280","https://rickandmortyapi.com/api/character/292","https://rickandmortyapi.com/api/character/293","https://rickandmortyapi.com/api/character/324","https://rickandmortyapi.com/api/character/326","https://rickandmortyapi.com/api/character/327","https://rickandmortyapi.com/api/character/332","https://rickandmortyapi.com/api/character/335","https://rickandmortyapi.com/api/character/341","https://rickandmortyapi.com/api/character/346","https://rickandmortyapi.com/api/character/347","https://rickandmortyapi.com/api/character/352","https://rickandmortyapi.com/api/character/353","https://rickandmortyapi.com/api/character/354","https://rickandmortyapi.com/api/character/357","https://rickandmortyapi.com/api/character/360","https://rickandmortyapi.com/api/character/361","https://rickandmortyapi.com/api/character/363","https://rickandmortyapi.com/api/character/365","https://rickandmortyapi.com/api/character/374","https://rickandmortyapi.com/api/character/377","https://rickandmortyapi.com/api/character/390","https://rickandmortyapi.com/api/character/391","https://rickandmortyapi.com/api/character/401","https://rickandmortyapi.com/api/character/402","https://rickandmortyapi.com/api/character/405","https://rickandmortyapi.com/api/character/423","https://rickandmortyapi.com/api/character/435","https://rickandmortyapi.com/api/character/437","https://rickandmortyapi.com/api/character/438","https://rickandmortyapi.com/api/character/439","https://rickandmortyapi.com/api/character/440","https://rickandmortyapi.com/api/character/452","https://rickandmortyapi.com/api/character/453","https://rickandmortyapi.com/api/character/467","https://rickandmortyapi.com/api/character/468","https://rickandmortyapi.com/api/character/469","https://rickandmortyapi.com/api/character/471","https://rickandmortyapi.com/api/character/492","https://rickandmortyapi.com/api/character/493"],"url":"https://rickandmortyapi.com/api/location/20","created":"2017-11-18T19:33:01.173Z"}
        """
        
        static let findCharacterByNameBet = """
            {"info":{"count":8,"pages":1,"next":"","prev":""},"results":[{"id":4,"name":"Beth Smith","status":"Alive","species":"Human","type":"","gender":"Female","origin":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"location":{"name":"Earth (Replacement Dimension)","url":"https://rickandmortyapi.com/api/location/20"},"image":"https://rickandmortyapi.com/api/character/avatar/4.jpeg","episode":["https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11","https://rickandmortyapi.com/api/episode/12","https://rickandmortyapi.com/api/episode/14","https://rickandmortyapi.com/api/episode/15","https://rickandmortyapi.com/api/episode/16","https://rickandmortyapi.com/api/episode/18","https://rickandmortyapi.com/api/episode/19","https://rickandmortyapi.com/api/episode/20","https://rickandmortyapi.com/api/episode/21","https://rickandmortyapi.com/api/episode/22","https://rickandmortyapi.com/api/episode/23","https://rickandmortyapi.com/api/episode/24","https://rickandmortyapi.com/api/episode/25","https://rickandmortyapi.com/api/episode/26","https://rickandmortyapi.com/api/episode/27","https://rickandmortyapi.com/api/episode/28","https://rickandmortyapi.com/api/episode/29","https://rickandmortyapi.com/api/episode/30","https://rickandmortyapi.com/api/episode/31"],"url":"https://rickandmortyapi.com/api/character/4","created":"2017-11-04T19:22:43.665Z"}]}
        """
        
        static let getAllCharacter = """
            {
            "info": {
            "count": 493,
            "pages": 25,
            "next": "https://rickandmortyapi.com/api/character/?page=2",
            "prev": ""
            },
            "results": [
            {
            "id": 1,
            "name": "Rick Sanchez",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
            "name": "Earth (C-137)",
            "url": "https://rickandmortyapi.com/api/location/1"
            },
            "location": {
            "name": "Earth (Replacement Dimension)",
            "url": "https://rickandmortyapi.com/api/location/20"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "episode": [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/3",
            "https://rickandmortyapi.com/api/episode/4",
            "https://rickandmortyapi.com/api/episode/5",
            "https://rickandmortyapi.com/api/episode/6",
            "https://rickandmortyapi.com/api/episode/7",
            "https://rickandmortyapi.com/api/episode/8",
            "https://rickandmortyapi.com/api/episode/9",
            "https://rickandmortyapi.com/api/episode/10",
            "https://rickandmortyapi.com/api/episode/11",
            "https://rickandmortyapi.com/api/episode/12",
            "https://rickandmortyapi.com/api/episode/13",
            "https://rickandmortyapi.com/api/episode/14",
            "https://rickandmortyapi.com/api/episode/15",
            "https://rickandmortyapi.com/api/episode/16",
            "https://rickandmortyapi.com/api/episode/17",
            "https://rickandmortyapi.com/api/episode/18",
            "https://rickandmortyapi.com/api/episode/19",
            "https://rickandmortyapi.com/api/episode/20",
            "https://rickandmortyapi.com/api/episode/21",
            "https://rickandmortyapi.com/api/episode/22",
            "https://rickandmortyapi.com/api/episode/23",
            "https://rickandmortyapi.com/api/episode/24",
            "https://rickandmortyapi.com/api/episode/25",
            "https://rickandmortyapi.com/api/episode/26",
            "https://rickandmortyapi.com/api/episode/27",
            "https://rickandmortyapi.com/api/episode/28",
            "https://rickandmortyapi.com/api/episode/29",
            "https://rickandmortyapi.com/api/episode/30",
            "https://rickandmortyapi.com/api/episode/31"
            ],
            "url": "https://rickandmortyapi.com/api/character/1",
            "created": "2017-11-04T18:48:46.250Z"
            },
            {
            "id": 2,
            "name": "Morty Smith",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
            "name": "Earth (C-137)",
            "url": "https://rickandmortyapi.com/api/location/1"
            },
            "location": {
            "name": "Earth (Replacement Dimension)",
            "url": "https://rickandmortyapi.com/api/location/20"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
            "episode": [
            "https://rickandmortyapi.com/api/episode/1",
            "https://rickandmortyapi.com/api/episode/2",
            "https://rickandmortyapi.com/api/episode/3",
            "https://rickandmortyapi.com/api/episode/4",
            "https://rickandmortyapi.com/api/episode/5",
            "https://rickandmortyapi.com/api/episode/6",
            "https://rickandmortyapi.com/api/episode/7",
            "https://rickandmortyapi.com/api/episode/8",
            "https://rickandmortyapi.com/api/episode/9",
            "https://rickandmortyapi.com/api/episode/10",
            "https://rickandmortyapi.com/api/episode/11",
            "https://rickandmortyapi.com/api/episode/12",
            "https://rickandmortyapi.com/api/episode/13",
            "https://rickandmortyapi.com/api/episode/14",
            "https://rickandmortyapi.com/api/episode/15",
            "https://rickandmortyapi.com/api/episode/16",
            "https://rickandmortyapi.com/api/episode/17",
            "https://rickandmortyapi.com/api/episode/18",
            "https://rickandmortyapi.com/api/episode/19",
            "https://rickandmortyapi.com/api/episode/20",
            "https://rickandmortyapi.com/api/episode/21",
            "https://rickandmortyapi.com/api/episode/22",
            "https://rickandmortyapi.com/api/episode/23",
            "https://rickandmortyapi.com/api/episode/24",
            "https://rickandmortyapi.com/api/episode/25",
            "https://rickandmortyapi.com/api/episode/26",
            "https://rickandmortyapi.com/api/episode/27",
            "https://rickandmortyapi.com/api/episode/28",
            "https://rickandmortyapi.com/api/episode/29",
            "https://rickandmortyapi.com/api/episode/30",
            "https://rickandmortyapi.com/api/episode/31"
            ],
            "url": "https://rickandmortyapi.com/api/character/2",
            "created": "2017-11-04T18:50:21.651Z"
            }]
            }
        """
        
    }
    
}
