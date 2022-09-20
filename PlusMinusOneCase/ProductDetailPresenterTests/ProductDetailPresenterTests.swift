//
//  ProductDetailPresenterTests.swift
//  ProductDetailPresenterTests
//
//  Created by Ufuk on 20.09.2022.
//

import XCTest
@testable import PlusMinusOneCase

class ProductDetailPresenterTests: XCTestCase {

    func testFetchProduct_didFetchProduct_isSuccess() {
        //Arrange
        let sut = makeSUT()
        
        //Act
        sut.didFetch(product: anyProduct())
        
        //Assert
        XCTAssertTrue(sut.productResponse != nil)
        XCTAssertTrue(sut.tableItems.count == 1)
    }
    
    func testFethSocial_didFetchSocial_isSuccess() {
        //Arrange
        let sut = makeSUT()
        
        //Act
        sut.didFetch(social: anySocial())
        
        //Assert
        XCTAssertTrue(sut.tableItems.count == 1)
    }
    
    func anyProduct() -> ProductResponse {
        ProductResponse(id: 1, name: "test", desc: "test", image: "https://dummyimage.com/450x300/4a4a4a/26d6a1", price: Price(value: 0, currency: "₺"))
    }
    
    func anySocial() -> SocialResponse {
        SocialResponse(likeCount: 10, commentCounts: CommentCounts(averageRating: 10, anonymousCommentsCount: 10, memberCommentsCount: 10))
    }

    func makeSUT() -> ProductDetailModule.Presenter {
        let sut = MockProductDetailPresenter()
        return sut
    }
}

class MockProductDetailPresenter: ProductDetailModule.Presenter {
    
    var view: ProductDetailModule.View?
    var interactor: ProductDetailModule.Interactor?
    var router: ProductDetailModule.Router?
    var productResponse: ProductResponse?
    var tableItems: [ProductDetailModule.ProductDetailTableItem] = []
    
    func viewDidLoad() {
        
    }
    
    func didFetch(product: ProductResponse) {
        productResponse = product
        tableItems.append(.detail(model: .init(id: product.id, name: product.name, desc: product.desc, price: product.price, likeCount: 0, commentCounts: CommentCounts(averageRating: 0, anonymousCommentsCount: 0, memberCommentsCount: 0))))
    }
    
    func didFetch(social: SocialResponse) {
        tableItems.append(.image(model: .init(imageURL: productResponse?.image ?? "")))
    }
    
    func fetchSocialAfterFinishTimer() {
        
    }
}
