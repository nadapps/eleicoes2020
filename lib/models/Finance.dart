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
      recipeAmmount = Finance.validateJson(json['dadosConsolidados']['totalRecebido']);
      recipeParty = Finance.validateJson(json['dadosConsolidados']['totalPartidos']);
      recipePF = Finance.validateJson(json['dadosConsolidados']['totalReceitaPF']);
    }

    if (json.containsKey('despesas') && json['despesas'] != null) {
      expenseAmmount = Finance.validateJson(json['despesas']['totalDespesasContratadas']);
      expenseLimit = Finance.validateJson(json['despesas']['valorLimiteDeGastos']);
      expensePaid = Finance.validateJson(json['despesas']['totalDespesasPagas']);
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

  static double validateJson(dynamic json) {
    return json == null ? 0.0 : json.toDouble();
  }
}
