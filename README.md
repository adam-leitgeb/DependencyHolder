# DependencyHolder

A lightweight dependency injection library for Swift that implements Inversion of Control (IoC) for resolving dependencies. 

DependencyHolder helps your app split into loosely-coupled components, which can be developed, tested and maintained more easily. DependencyHolder is powered by the Swift generic type system and first class functions to define dependencies of your app. 

## Usage

### Create a dependency

```
protocol TestUseCase: Dependency {
}

final class MockTestUseCase: TestUseCase {
}

final class ProductionTestUseCase: TestUseCase {
}
```

### Insert dependency into dependency holder

```
let dependencyHolder = DependencyHolder()

let testUseCase = ProductionTestUseCase()
dependencyHolder.add(TestUseCase.self, constructor: testUseCase)

```

### Obtain the dependency where needed

```
final class TestViewModel: ObservableObject {

    let testUseCase: TestUseCase
    
    init(dependencyHolder: DependencyHolder) {
        testUseCase = dependencyHolder.get()
    }
}
```
