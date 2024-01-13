//
//  ConfirmValidateTests.swift
//  ValidateTests
//
//  Created by 김도현 on 2024/01/11.
//

import XCTest
@testable import InputManager

final class PasswordValidateTests: XCTestCase {

    func makeSut(fieldName: String) -> validatable {
        return PasswordValidation(fieldName: fieldName, passwordValidator: PasswordValidator())
    }
    
    func test_패스워드_형식이_맞지_않는경우_passwordValidate_Error를_반환() {
        let sut = makeSut(fieldName: "password")
        let error = sut.validate(data: ["password": "testtest"])
        XCTAssertEqual(error, .passwordValidate)
    }
    
    func test_패스워드_숫자가_없는_경우_passwordValidate_Error를_반환() {
        let sut = makeSut(fieldName: "password")
        let error = sut.validate(data: ["password": "test!@$@"])
        XCTAssertEqual(error, .passwordValidate)
    }
    
    func test_패스워드_특수문자가_없는_경우_passwordValidate_Error를_반환() {
        let sut = makeSut(fieldName: "password")
        let error = sut.validate(data: ["password": "test1234"])
        XCTAssertEqual(error, .passwordValidate)
    }
    
    func test_패스워드_글자_갯수가_맞지_않는경우_passwordValidate_Error를_반환() {
        let sut = makeSut(fieldName: "password")
        let error = sut.validate(data: ["password": "test12@"])
        XCTAssertEqual(error, .passwordValidate)
    }
    
    func test_패스워드_형식이_맞는_경우_nil을_반환() {
        let sut = makeSut(fieldName: "password")
        let error = sut.validate(data: ["password": "test1234@"])
        XCTAssertNil(error)
    }

}
