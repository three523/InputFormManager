//
//  SignUpValidateTests.swift
//  ValidateTests
//
//  Created by 김도현 on 2024/01/11.
//

import XCTest
@testable import InputManager

final class SignUpValidateTests: XCTestCase {
    
    func makeData(email: String, password: String, passwordConfirm: String) -> [String: Any] {
        return ["email": email, "password": password, "passwordConfirm": passwordConfirm]
    }
    
    func test_회원가입_할때_모두_입력하지_않은_경우_requiredEmpty_email_Error를_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "", password: "", passwordConfirm: "")
        let error = sut.validate(data: data)
        XCTAssertEqual(error, .requiredEmpty("email"))
    }
    
    func test_회원가입_할때_이메일을_형식에_맞지_않게_입력한_경우_emailValidate_Error를_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "test@test", password: "", passwordConfirm: "")
        let error = sut.validate(data: data)
        XCTAssertEqual(error, .emailValidate)
    }
    
    func test_회원가입_할때_이메일을_형식에_맞지_않게_입력하고_패스워드를_입력한_경우_emailValidate_Error를_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "test@test", password: "testest", passwordConfirm: "")
        let error = sut.validate(data: data)
        XCTAssertEqual(error, .emailValidate)
    }
    
    func test_회원가입_할때_패스워드와_패스워드_확인을_입력하지_않은_경우_requiredEmpty_password_Error를_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "test@test.com", password: "", passwordConfirm: "")
        let error = sut.validate(data: data)
        XCTAssertEqual(error, .requiredEmpty("password"))
    }
    
    func test_회원가입_할때_패스워드를_형식에_맞지_않게_입력한_경우_passwordValidate_Error를_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "test@test.com", password: "testtest", passwordConfirm: "")
        let error = sut.validate(data: data)
        XCTAssertEqual(error, .passwordValidate)
    }
    
    func test_회원가입_할때_패스워드를_형식에_맞게_입력한_경우_confirm_Error을_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "test@test.com", password: "test1234@", passwordConfirm: "")
        let error = sut.validate(data: data)
        XCTAssertEqual(error, .confirm("password", "passwordConfirm"))
    }
    
    func test_회원가입_할때_패스워드_확인을_입력하지_않은_경우_confirm_password_passwordConfirm_Error를_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "test@test.com", password: "test1234@", passwordConfirm: "")
        let error = sut.validate(data: data)
        XCTAssertEqual(error, .confirm("password", "passwordConfirm"))
    }
    
    func test_회원가입_할때_패스워드_확인을_다르게_입력한_경우_confirm_password_passwordConfirm_Error를_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "test@test.com", password: "test1234@", passwordConfirm: "test123@")
        let error = sut.validate(data: data)
        XCTAssertEqual(error, .confirm("password", "passwordConfirm"))
    }
    
    func test_회원가입_할때_모두_입력하고_형식이_맞을경우_nil을_반환함() {
        let sut = ValidationFactory.makeSignUpValidation()
        let data = makeData(email: "test@test.com", password: "test1234@", passwordConfirm: "test1234@")
        let error = sut.validate(data: data)
        XCTAssertNil(error)
    }

}
