import XCTest
@testable import DependencyHolder

final class DependencyHolderTests: XCTestCase {

    // MARK: - Properties

    private var dependencyHolder = DependencyHolder()

    // MARK: - Tests

    func testInsert() throws {
        dependencyHolder.add(TestAdapter.self, constructor: ProductionTestAdapter.init)
        dependencyHolder.add(TestUseCase.self, constructor: ProductionTestUseCase.init)

        let testAdapter: TestAdapter = dependencyHolder.get()
        XCTAssertTrue(testAdapter is ProductionTestAdapter)

        let testUseCase: TestUseCase = dependencyHolder.get()
        XCTAssertTrue(testUseCase is ProductionTestUseCase)
    }
}
