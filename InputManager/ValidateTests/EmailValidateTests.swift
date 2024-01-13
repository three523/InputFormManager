//
//  ValidateTests.swift
//  ValidateTests
//
//  Created by 김도현 on 2024/01/11.
//

import XCTest
@testable import InputManager

final class EmailValidateTests: XCTestCase {

    func makeSut(fieldName: String) -> validatable {
        return EmailValidation(fieldName: fieldName, emailValidator: EmailValidator())
    }
    
    func test_이메일의_골뱅이가_없을경우_emailValidateError를_리턴한다() {
        let sut = makeSut(fieldName: "email")
        let error = sut.validate(data: ["email": "testtest.com"])
        XCTAssertEqual(error, .emailValidate, "이메일 형식이 틀릴때 emailVaildateError를 리턴하지 않음")
    }
    
    func test_이메일의_온점이_없을경우_emailValidateError를_리턴한다() {
        let sut = makeSut(fieldName: "email")
        let error = sut.validate(data: ["email": "test@testcom"])
        XCTAssertEqual(error, .emailValidate, "이메일 형식이 틀릴때 emailVaildateError를 리턴하지 않음")
    }
    
    func test_이메일의_온점이후_글자가_없을경우_emailValidateError를_리턴한다() {
        let sut = makeSut(fieldName: "email")
        let error = sut.validate(data: ["email": "test@test."])
        XCTAssertEqual(error, .emailValidate, "이메일 형식이 틀릴때 emailVaildateError를 리턴하지 않음")
    }
    
    func test_이메일의_형식이_맞을경우_nil을_리턴한다() {
        let sut = makeSut(fieldName: "email")
        let error = sut.validate(data: ["email": "test@test.com"])
        XCTAssertNil(error, "이메일 형식이 맞을때 nil을 리턴하지 않음")
    }
}
