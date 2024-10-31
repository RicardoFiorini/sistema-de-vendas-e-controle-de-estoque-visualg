algoritmo "Sistema de Vendas e Controle de Estoque"
variáveis
    tipo Produto
        codigo : inteiro
        nome : caractere
        precoCompra : real
        precoVenda : real
        quantidadeEstoque : inteiro
    fimTipo

    produtos : vetor[1..100] de Produto
    totalProdutos : inteiro
    vendas : real
    lucroTotal : real
    opcao : inteiro
    codigoProduto, quantidade : inteiro
    valorTotalEstoque : real

início
    totalProdutos ← 0
    vendas ← 0
    lucroTotal ← 0

    // Função para cadastrar um novo produto
    funcao cadastrarProduto()
        totalProdutos ← totalProdutos + 1
        escreva("Código do produto: ")
        leia(produtos[totalProdutos].codigo)
        escreva("Nome do produto: ")
        leia(produtos[totalProdutos].nome)
        escreva("Preço de compra do produto: ")
        leia(produtos[totalProdutos].precoCompra)
        escreva("Preço de venda do produto: ")
        leia(produtos[totalProdutos].precoVenda)
        escreva("Quantidade inicial em estoque: ")
        leia(produtos[totalProdutos].quantidadeEstoque)
        escreva("Produto cadastrado com sucesso!\n")
    fimfuncao

    // Função para exibir o estoque
    funcao exibirEstoque()
        escreva("\n=== Estoque Atual ===\n")
        para i de 1 até totalProdutos faça
            escreva("Código: ", produtos[i].codigo, ", Nome: ", produtos[i].nome, ", Quantidade: ", produtos[i].quantidadeEstoque, ", Preço de Venda: R$ ", produtos[i].precoVenda, "\n")
        fimpara
    fimfuncao

    // Função para registrar uma venda
    funcao registrarVenda()
        escreva("Código do produto vendido: ")
        leia(codigoProduto)
        escreva("Quantidade vendida: ")
        leia(quantidade)

        para i de 1 até totalProdutos faça
            se produtos[i].codigo = codigoProduto então
                se produtos[i].quantidadeEstoque >= quantidade então
                    produtos[i].quantidadeEstoque ← produtos[i].quantidadeEstoque - quantidade
                    vendas ← vendas + (produtos[i].precoVenda * quantidade)
                    lucroTotal ← lucroTotal + ((produtos[i].precoVenda - produtos[i].precoCompra) * quantidade)
                    escreva("Venda registrada com sucesso!\n")
                    retorne
                senão
                    escreva("Quantidade insuficiente no estoque.\n")
                    retorne
                fimse
            fimse
        fimpara
        escreva("Produto não encontrado.\n")
    fimfuncao

    // Função para calcular o valor total do estoque
    funcao calcularValorEstoque()
        valorTotalEstoque ← 0
        para i de 1 até totalProdutos faça
            valorTotalEstoque ← valorTotalEstoque + (produtos[i].precoCompra * produtos[i].quantidadeEstoque)
        fimpara
        escreva("Valor total do estoque: R$ ", valorTotalEstoque, "\n")
    fimfuncao

    // Função para exibir relatório financeiro
    funcao exibirRelatorioFinanceiro()
        escreva("\n=== Relatório Financeiro ===\n")
        escreva("Total de vendas: R$ ", vendas, "\n")
        escreva("Lucro total: R$ ", lucroTotal, "\n")
        calcularValorEstoque()
    fimfuncao

    // Menu principal
    repita
        escreva("\n=== Sistema de Vendas e Controle de Estoque ===\n")
        escreva("1. Cadastrar Produto\n")
        escreva("2. Exibir Estoque\n")
        escreva("3. Registrar Venda\n")
        escreva("4. Exibir Relatório Financeiro\n")
        escreva("0. Sair\n")
        escreva("Escolha uma opção: ")
        leia(opcao)

        escolha opcao
            caso 1
                cadastrarProduto()
            caso 2
                exibirEstoque()
            caso 3
                registrarVenda()
            caso 4
                exibirRelatorioFinanceiro()
            caso 0
                escreva("Saindo do sistema...\n")
            caso contrário
                escreva("Opção inválida. Tente novamente.\n")
        fimescolha
    até opcao = 0
fimalgoritmo
