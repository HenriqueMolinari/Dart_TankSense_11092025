# TankSense - Monitoramento de Nível de Tanques

O **TankSense** é um sistema desenvolvido em **Dart** para **monitorar, simular e registrar o nível de tanque** em tanques utilizando medições simuladas com base em um **sensor ultrassônico virtual**.  
Ele calcula a distância, o nível de armazenamento, o percentual de ocupação e o status do tanque, exibindo tudo **em tempo real** no terminal.

---

## 📌 **Funcionalidades**

✅ Simula **leituras de distância** do sensor ultrassônico  
✅ Calcula **nível de tanque (cm)** com base na altura do tanque  
✅ Calcula **percentual de ocupação (%)**  
✅ Define **status do tanque** (ALTO, MÉDIO ou BAIXO) com **cores no terminal**  
✅ Exibe os **últimos 10 registros** atualizados em tempo real  
✅ Mantém um **histórico limitado** para evitar sobrecarga  
✅ Interface **limpa e responsiva** com atualização automática

---

## 🛠️ **Tecnologias Utilizadas**

- **Linguagem:** [Dart](https://dart.dev)
- **Bibliotecas nativas:**
  - `dart:math` → gera valores aleatórios para simular o sensor
  - `dart:async` → executa atualizações periódicas com `Timer`
  - `dart:io` → manipula o terminal e imprime informações coloridas

---

## 🚀 **Como Executar o Projeto**

### **1. Instale o Dart**
Baixe e instale o Dart:  
🔗 [https://dart.dev/get-dart](https://dart.dev/get-dart)

Verifique se o Dart está instalado:
```bash
dart --version
