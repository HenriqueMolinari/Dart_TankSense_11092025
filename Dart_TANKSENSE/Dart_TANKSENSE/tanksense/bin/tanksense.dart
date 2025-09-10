// Importa a biblioteca 'dart:math' que permite trabalhar com funções matemáticas,
// como números aleatórios, máximo, mínimo, etc.
import 'dart:math';

// Importa a biblioteca 'dart:async' para trabalhar com temporizadores (Timer),
// que são usados para executar ações repetidamente em intervalos de tempo.
import 'dart:async';

// Importa a biblioteca 'dart:io' para manipular entradas e saídas,
// como limpar o console e escrever no terminal.
import 'dart:io';

void main() {
  // Cria um "map" chamado tanque para armazenar informações do tanque.
  // Ele possui a altura do tanque e um histórico de medições.
  final Map<String, dynamic> tanque = {
    'altura': 100.0, // Altura máxima do tanque em centímetros.
    'historico':
        <
          Map<String, dynamic>
        >[], // Lista para armazenar os dados das últimas medições.
  };

  // Cria um temporizador que executa uma função a cada 3 segundos.
  Timer.periodic(Duration(seconds: 3), (timer) {
    // Simula a distância entre o sensor ultrassônico e o nível da tanque.
    // Gera um valor aleatório entre 5 cm e a altura total do tanque.
    final distancia = 5.0 + Random().nextDouble() * tanque['altura'];

    // Calcula o nível de polimeros no tanque:
    // Subtrai a distância medida da altura do tanque para obter a altura da tanque.
    // O "+5" é um ajuste para compensar a distância mínima do sensor até a tampa do tanque.
    // Usa a função max() para garantir que o valor nunca seja negativo.
    final nivel = max(0, tanque['altura'] - distancia + 5);

    // Calcula o percentual de ocupação do tanque:
    // Divide o nível de água pela altura máxima e multiplica por 100.
    // Usa max() e min() para garantir que o valor fique entre 0% e 100%.
    final percentual = min(100, max(0, (nivel / tanque['altura']) * 100));

    // Declara variáveis para armazenar o status textual e a cor do texto.
    String status;
    String cor;

    // Define o status e a cor do texto baseado no percentual de ocupação:
    if (percentual >= 75) {
      // Se o tanque estiver com 75% ou mais de tanque.
      status = "ALTO";
      cor = "\x1b[32m"; // Verde
    } else if (percentual >= 30) {
      // Se o tanque estiver entre 30% e 75% de tanque.
      status = "MÉDIO";
      cor = "\x1B[33m"; // Amarelo
    } else {
      // Se o tanque estiver com menos de 30% de tanque.
      status = "BAIXO";
      cor = "\x1B[31m"; // Vermelho
    }

    // Adiciona uma nova leitura ao histórico do tanque.
    // Cada registro contém: distância, nível, percentual, status e data/hora da medição.
    tanque['historico'].add({
      'distancia': distancia,
      'nivel': nivel,
      'percentual': percentual,
      'status': status,
      'timestamp': DateTime.now(),
    });

    // Mantém o histórico limitado a no máximo 10 registros.
    // Caso o tamanho ultrapasse 10, remove o mais antigo (primeiro da lista).
    if (tanque['historico'].length > 10) {
      tanque['historico'].removeAt(0);
    }

    // Limpa o console para atualizar as informações sempre no mesmo lugar.
    // Este comando funciona na maioria dos terminais modernos (Windows e Linux).
    stdout.write("\x1B[2J\x1B[0;0H");

    // Imprime as informações atuais do tanque no console:
    stdout.writeln("--------------------------------");
    stdout.writeln(" ");
    stdout.writeln("~~~~~~~~~~ TANKSENSE ~~~~~~~~~~"); // Nome do sistema
    stdout.writeln(" ");
    stdout.writeln(
      "Distancia: ${distancia.toStringAsFixed(2)} cm",
    ); // Distância medida pelo sensor.
    stdout.writeln(
      "Nivel: ${nivel.toStringAsFixed(2)} cm",
    ); // Nível calculado da água.
    stdout.writeln(
      "Percentual: ${percentual.toStringAsFixed(1)}%",
    ); // Porcentagem do tanque cheio.
    stdout.writeln(
      "Status: $cor$status\x1b[0m",
    ); // Status colorido (ALTO, MÉDIO, BAIXO).
    stdout.writeln(" ");
    stdout.writeln("--------------------------------");
  });
}
