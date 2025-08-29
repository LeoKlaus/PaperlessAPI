//
//  RuleType.swift
//  PaperlessAPI
//
//  Created by Leo Wehrfritz on 13.12.24.
//

// Ref: https://github.com/paperless-ngx/paperless-ngx/blob/dev/src/documents/models.py#L480
public enum RuleType: RawRepresentable, Codable, Equatable, Hashable, Sendable {
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
    case asnGreaterThan             //23
    case asnLessThan                //24
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
    case createdTo                  //43
    case createdFrom                //44
    case addedTo                    //45
    case addedFrom                  //46
    case mimeTypeIs                 //47
    case unknown(Int)
    
    public typealias RawValue = Int
    public var rawValue: Int {
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
        case .asnGreaterThan:
            return(23)
        case .asnLessThan:
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
        case .createdTo:
            return(43)
        case .createdFrom:
            return(44)
        case .addedTo:
            return(45)
        case .addedFrom:
            return(46)
        case .mimeTypeIs:
            return(47)
        case .unknown(let int):
            return int
        }
    }
    
    public init(rawValue: Int) {
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
            self = .asnGreaterThan
        case 24:
            self = .asnLessThan
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
        case 43:
            self = .createdTo
        case 44:
            self = .createdFrom
        case 45:
            self = .addedTo
        case 46:
            self = .addedFrom
        case 47:
            self = .mimeTypeIs
        default:
            self = .unknown(rawValue)
        }
    }
}
