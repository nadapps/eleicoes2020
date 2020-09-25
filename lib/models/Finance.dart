class Finance {
  final double recipeAmmount;
  final double recipeParty;
  final double recipePF;
  final double expenseAmmount;
  final double expenseLimit;
  final double expensePaid;

  Finance(
      {this.recipeAmmount,
      this.expenseAmmount,
      this.recipeParty,
      this.recipePF,
      this.expenseLimit,
      this.expensePaid});

  factory Finance.fromJson(Map<String, dynamic> json) {
    double recipeAmmount = 0;
    double recipeParty = 0;
    double recipePF = 0;
    double expenseAmmount = 0;
    double expenseLimit = 0;
    double expensePaid = 0;

    if (json.containsKey('dadosConsolidados') &&
        json['dadosConsolidados'] != null) {
      recipeAmmount = json['dadosConsolidados']['totalRecebido'];
      recipeParty = json['dadosConsolidados']['totalPartidos'];
      recipePF = json['dadosConsolidados']['totalReceitaPF'];
    }

    if (json.containsKey('despesas') && json['despesas'] != null) {
      expenseAmmount = json['despesas']['totalDespesasContratadas'];
      expenseLimit = json['despesas']['valorLimiteDeGastos'];
      expensePaid = json['despesas']['totalDespesasPagas'];
    }

    return Finance(
      recipeAmmount: recipeAmmount,
      recipeParty: recipeParty,
      recipePF: recipePF,
      expenseAmmount: expenseAmmount,
      expenseLimit: expenseLimit,
      expensePaid: expensePaid,
    );
  }
}
