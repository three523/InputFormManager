//
//  fieldConfirmValidate.swift
//  ValidateTests
//
//  Created by 김도현 on 2024/01/11.
//

import XCTest
@testable import InputManager

final class FieldConfirmValidate: XCTestCase {

    func makeSut(fieldName: String, confirmFieldName: String) -> validatable {
        return ConfirmValidation(fieldName: fieldName, fieldNameToCompare: confirmFieldName)
    }
    
    func test_필드의_텍스트와_필드확인_텍스트가_같지_않은경우_에러를_반환한다() {
        let sut = makeSut(fieldName: "name", confirmFieldName: "nameConfirm")
        let error = sut.validate(data: ["name": "test", "nameConfirm": "Test"])
        XCTAssertEqual(error, .confirm("name", "nameConfirm"))
    }
    
    func test_필드의_이름과_필드확인의_이름이_같지_않은경우_에러메세지에는_필드의_이름과_필드확인의_이름을_반환한다() {
        let sut = makeSut(fieldName: "name", confirmFieldName: "nameConfirm")
        let error = sut.validate(data: ["name": "test", "nameConfirm": "Test"])
        XCTAssertEqual(error?.localizedDescription, "name and nameConfirm are not the same")
    }
    
    func test_필드의_텍스트와_필드확인_텍스트가_같은_경우_nil을_반환한다() {
        let sut = makeSut(fieldName: "name", confirmFieldName: "nameConfirm")
        let error = sut.validate(data: ["name": "test", "nameConfirm": "test"])
        XCTAssertNil(error)
    }

}
