//
//  RequiredValidateTests.swift
//  ValidateTests
//
//  Created by 김도현 on 2024/01/11.
//

import XCTest
@testable import InputManager

final class RequiredValidateTests: XCTestCase {

    func makeSut(fieldName: String) -> validatable {
        RequiredFieldValidation(fieldName: fieldName)
    }
    
    func test_필수로_입력해야할_내용을_입력하지_않으면_필드이름을_포함한_requiredEmptyError를_리턴함() {
        let sut = makeSut(fieldName: "email")
        let error = sut.validate(data: ["email": ""])
        XCTAssertEqual(error, .requiredEmpty("email"))
    }
        
    func test_필수로_입력해야할_내용을_입력하면_nil을_리턴함() {
        let sut = makeSut(fieldName: "email")
        let error = sut.validate(data: ["email": "test"])
        XCTAssertNil(error)
    }

}
