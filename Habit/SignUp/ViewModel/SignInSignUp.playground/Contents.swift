import Combine

// SignIn ViewModel
var cancellable: AnyCancellable?
let publisher = PassthroughSubject<Bool, Never>()


// Alguem irá notificar o valor booleano. 
// Ou seja, a SignIn irá ficar esperando alguem notificar que essa variável mudou o estado
cancellable = publisher.sink { value in
    print(value)
}

 
// SignUp ViewModel
// Fazer uma ação -> Notificar a SignInViewModel que algo aconteceu

var p: PassthroughSubject<Bool, Never> = publisher

// Depois de apertar o botão e o servidor retornar SUCCESS
print("Nao enviou ainda")
p.send(true)
print("ja enviou")
