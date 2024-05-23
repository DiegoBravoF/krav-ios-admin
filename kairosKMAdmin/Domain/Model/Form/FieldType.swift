//
//  FieldType.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 27/9/23.
//

import Foundation
import SwiftUI

enum FieldType {
    case name
    case firstSurname
    case secondSurname
    case email
    case loginEmail
    case password
    case phone
    case prefix
    case sosPhone
    case profileFoto
    case birthdate
    case postalCode
    case classSchedule
    case kronosDay
    case knownKairos
    case kmInterest
    case regulationTerm
    case consentTerm
    case videoTerm
    case privacyTerm
    case issueType
    case issueDescription
    case issueStudent
    case injuryType

    var title: String {
        switch self {
        case .name:                 return "Nombre"
        case .firstSurname:         return "Primer Apellido"
        case .secondSurname:        return "Segundo Apellido"
        case .email,
                .loginEmail:        return "Email"
        case .password:             return "Contraseña"
        case .phone:                return "Teléfono"
        case .prefix:               return "Prefijo"
        case .sosPhone:             return "Teléfono en caso de emergencia"
        case .profileFoto:          return "Foto de perfil"
        case .birthdate:            return "Fecha de nacimiento"
        case .postalCode:           return "Código Postal"
        case .classSchedule:        return "Elige tu horario habitual (variaciones puntuales no hay problema, para recurrentes consultar)."
        case .kronosDay:            return "Si vas a elegir la tarifa de 1 clase semanal, elige el día que vendrás habitualmente"
        case .knownKairos:          return "¿Cómo nos has conocido?"
        case .kmInterest:           return "Principalmente, ¿por qué te has interesado por el Krav Maga?"
        case .regulationTerm:       return "He leído atentamente y acepto el reglamento interno (en él están también los términos y condiciones. Hazlo, es importante. [Abrir reglamento](https://www.kairoskravmaga.com/reglamento)"
        case .consentTerm:          return "He leído y acepto el consentimiento informado [Leer consentimiento informado](https://www.kairoskravmaga.com/consentimientoinformado)"
        case .videoTerm:            return "En las clases grabamos vídeos cortos para mostrar nuestra actividad. Necesitamos pedirte que nos autorices porque nos es imposible sacar a unos alumnos sí y otros no. Por favor, marca esta casilla para autorizarnos a sacarte en vídeos en nuestras redes y páginas web."
        case .privacyTerm:          return "Por favor, acepta nuestra política de privacidad. Mientras seas alumn@, recibirás emails informativos sobre nuestra actividad. Si desgraciadamente dejas de serlo, no te escribiremos más. [Política de privacidad](https://www.kairoskravmaga.com/politicadeprivacidad)"
        case .issueType:            return "Tipo de incidencia"
        case .issueDescription:     return "Comentario"
        case .issueStudent:         return "Alumno"
        case .injuryType:           return "Tipo de lesión"
        }
    }

    var hint: String? {
        switch self {
        case .profileFoto:      return "Subir archivo compatible (máximo 15 MB)"
        default:                return nil
        }
    }

    var error: String {
        return ""
    }

    var placeholder: String {
        switch self {
        case .kronosDay:        return "Solo si eliges 1 clase semanal"
        default:                return "Selecciona"
        }
    }

    var isDisabled: Bool {
        switch self {
        case .email:            return true
        default:                return false
        }
    }

    var keyboardType: UIKeyboardType {
        switch self {
        case .email,
                .loginEmail:    return .emailAddress
        case .phone,
                .sosPhone:      return .phonePad
        case .postalCode:       return .decimalPad
        default:                return .default
        }
    }

    var autocorrectionDisabled: Bool {
        return true
    }

    var capitalization: TextInputAutocapitalization {
        switch self {
        case .email,
                .loginEmail,
                .password:      return .never
        default:                return .sentences
        }
    }

    var dropDownOptions: [String] {
        switch self {
        case .kronosDay:        return ["Lunes", "Martes", "Miércoles", "Jueves"]
        case .classSchedule:    return ["Lunes y Miércoles 10.30h", "Lunes y Miércoles 18.30h", "Lunes y Miércoles 20.00h", "Martes y Jueves 18.30h", "Martes y Jueves 20.00h", "Horario rotativo (concretar con Irene primero)"]
        case .kmInterest:       return ["Me preocupa mi seguridad",
                                        "Quiero hacer deporte",
                                        "He sentido curiosidad",
                                        "Me apetece hacer una actividad nueva",
                                        "He tenido una mala experiencia",
                                        "Utilidad profesional",
                                        "Otra"]
        case .knownKairos:      return ["Buscando en Google",
                                        "Me lo recomendó alguien",
                                        "Al pasar por la calle",
                                        "Instagram",
                                        "Facebook",
                                        "Leyendo en foros",
                                        "Soy antiguo/a alumno/a de Kairos",
                                        "Otros"]
        case .prefix:           return ["+34", "+43"]
        case .issueType:        return IssueType.allCases.map { $0.title }
        case .injuryType:       return InjuryType.allCases.map { $0.title }
        default:                return []
        }
    }

    var isCalendarField: Bool {
        switch self {
        case .birthdate:        return true
        default:                return false
        }
    }

    var hasDropDown: Bool {
        !self.dropDownOptions.isEmpty
    }

    var regex: String {
        switch self {
        case .name,
                .firstSurname,
                .secondSurname: return "^[a-zA-ZÀ-ÿ `'-.@]{1,20}$"
        case .postalCode:       return "\\d{4}"
        default:                return "\\d{7}"
        }
    }
}
