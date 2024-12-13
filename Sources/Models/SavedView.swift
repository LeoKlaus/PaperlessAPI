//
//  SavedView.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

import Foundation

struct SavedView: Codable {
    let id: Int
    let name: String
    let showOnDashboard: Bool
    let showInSidebar: Bool
    let sortField: String
    let sortReverse: Bool
    let filterRules: [FilterRule]
    let pageSize: Int?
    let displayMode: DisplayMode?
    let displayFields: [String]?
    let owner: Int?
    let userCanChange: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case showOnDashboard = "show_on_dashboard"
        case showInSidebar = "show_in_sidebar"
        case sortField = "sort_field"
        case sortReverse = "sort_reverse"
        case filterRules = "filter_rules"
        case pageSize = "page_size"
        case displayMode = "display_mode"
        case displayFields = "display_fields"
        case owner
        case userCanChange = "user_can_change"
    }
}

struct FilterRule: Codable, Equatable {
    let ruleType: RuleType
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case ruleType = "rule_type"
        case value
    }
}

/// Ref: https://github.com/paperless-ngx/paperless-ngx/blob/dev/src/documents/models.py#L480
enum RuleType: RawRepresentable, Codable, Equatable {
    case titleContains              //0
    case contentContains            //1
    case asnIs                      //2
    case correspondentIs            //3
    case documentTypeIs             //4
    case isInInbox                  //5
    case hasTag                     //6
    case hasAnyTag                  //7
    case createdBefore              //8
    case createdAfter               //9
    case createdYearIs              //10
    case createdMonthIs             //11
    case createdDayIs               //12
    case addedBefore                //13
    case addedAfter                 //14
    case modifiedBefore             //15
    case modifiedAfter              //16
    case doesNotHaveTag             //17
    case doesNotHaveAsn             //18
    case titleOrContentContains     //19
    case fulltextQuery              //20
    case moreLikeThis               //21
    case hasTagsIn                  //22
    case AsnGreaterThan             //23
    case AsnLessThan                //24
    case storagePathIs              //25
    case hasCorrespondentIn         //26
    case doesNotHaveCorrespondentIn //27
    case hasDocumentTypeIn          //28
    case doesNotHaveDocumentTypeIn  //29
    case hasStoragePathIn           //30
    case doesNotHaveStoragePathIn   //31
    case ownerIs                    //32
    case hasOwnerIn                 //33
    case doesNotHaveOwner           //34
    case doesNotHaveOwnerIn         //35
    case hasCustomFieldValue        //36
    case isSharedByMe               //37
    case hasCustomFields            //38
    case hasCustomFieldIn           //39
    case doesNotHaveCustomFieldIn   //40
    case doesNotHaveCustomField     //41
    case customFieldsQuery          //42
    case unknown(Int)
    
    typealias RawValue = Int
    var rawValue: Int {
        switch self {
        case .titleContains:
            return(0)
        case .contentContains:
            return(1)
        case .asnIs:
            return(2)
        case .correspondentIs:
            return(3)
        case .documentTypeIs:
            return(4)
        case .isInInbox:
            return(5)
        case .hasTag:
            return(6)
        case .hasAnyTag:
            return(7)
        case .createdBefore:
            return(8)
        case .createdAfter:
            return(9)
        case .createdYearIs:
            return(10)
        case .createdMonthIs:
            return(11)
        case .createdDayIs:
            return(12)
        case .addedBefore:
            return(13)
        case .addedAfter:
            return(14)
        case .modifiedBefore:
            return(15)
        case .modifiedAfter:
            return(16)
        case .doesNotHaveTag:
            return(17)
        case .doesNotHaveAsn:
            return(18)
        case .titleOrContentContains:
            return(19)
        case .fulltextQuery:
            return(20)
        case .moreLikeThis:
            return(21)
        case .hasTagsIn:
            return(22)
        case .AsnGreaterThan:
            return(23)
        case .AsnLessThan:
            return(24)
        case .storagePathIs:
            return(25)
        case .hasCorrespondentIn:
            return(26)
        case .doesNotHaveCorrespondentIn:
            return(27)
        case .hasDocumentTypeIn:
            return(28)
        case .doesNotHaveDocumentTypeIn:
            return(29)
        case .hasStoragePathIn:
            return(30)
        case .doesNotHaveStoragePathIn:
            return(31)
        case .ownerIs:
            return(32)
        case .hasOwnerIn:
            return(33)
        case .doesNotHaveOwner:
            return(34)
        case .doesNotHaveOwnerIn:
            return(35)
        case .hasCustomFieldValue:
            return(36)
        case .isSharedByMe:
            return(37)
        case .hasCustomFields:
            return(38)
        case .hasCustomFieldIn:
            return(39)
        case .doesNotHaveCustomFieldIn:
            return(40)
        case .doesNotHaveCustomField:
            return(41)
        case .customFieldsQuery:
            return(42)
        case .unknown(let int):
            return int
        }
    }
    
    init(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .titleContains
        case 1:
            self = .contentContains
        case 2:
            self = .asnIs
        case 3:
            self = .correspondentIs
        case 4:
            self = .documentTypeIs
        case 5:
            self = .isInInbox
        case 6:
            self = .hasTag
        case 7:
            self = .hasAnyTag
        case 8:
            self = .createdBefore
        case 9:
            self = .createdAfter
        case 10:
            self = .createdYearIs
        case 11:
            self = .createdMonthIs
        case 12:
            self = .createdDayIs
        case 13:
            self = .addedBefore
        case 14:
            self = .addedAfter
        case 15:
            self = .modifiedBefore
        case 16:
            self = .modifiedAfter
        case 17:
            self = .doesNotHaveTag
        case 18:
            self = .doesNotHaveAsn
        case 19:
            self = .titleOrContentContains
        case 20:
            self = .fulltextQuery
        case 21:
            self = .moreLikeThis
        case 22:
            self = .hasTagsIn
        case 23:
            self = .AsnGreaterThan
        case 24:
            self = .AsnLessThan
        case 25:
            self = .storagePathIs
        case 26:
            self = .hasCorrespondentIn
        case 27:
            self = .doesNotHaveCorrespondentIn
        case 28:
            self = .hasDocumentTypeIn
        case 29:
            self = .doesNotHaveDocumentTypeIn
        case 30:
            self = .hasStoragePathIn
        case 31:
            self = .doesNotHaveStoragePathIn
        case 32:
            self = .ownerIs
        case 33:
            self = .hasOwnerIn
        case 34:
            self = .doesNotHaveOwner
        case 35:
            self = .doesNotHaveOwnerIn
        case 36:
            self = .hasCustomFieldValue
        case 37:
            self = .isSharedByMe
        case 38:
            self = .hasCustomFields
        case 39:
            self = .hasCustomFieldIn
        case 40:
            self = .doesNotHaveCustomFieldIn
        case 41:
            self = .doesNotHaveCustomField
        case 42:
            self = .customFieldsQuery
        default:
            self = .unknown(rawValue)
        }
    }
}

enum DisplayMode: RawRepresentable, Codable, Equatable {
    case smallCards, largeCards, table
    case unknown(String)
    
    typealias RawValue = String
    var rawValue: String {
        switch self {
        case .smallCards:
            return "smallCards"
        case .largeCards:
            return "largeCards"
        case .table:
            return "table"
        case .unknown(let str):
            return "unknown: \(str)"
        }
    }
    
    init(rawValue: String) {
        switch rawValue {
        case "smallCards":
            self = .smallCards
        case "largeCards":
            self = .largeCards
        case "table":
            self = .table
        default:
            self = .unknown(rawValue)
        }
    }
}
