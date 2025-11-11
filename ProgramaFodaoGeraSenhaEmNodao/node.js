#!/usr/bin/env node
/**
 * Gerador de senhas (Node.js)
 * Gera senhas com pelo menos uma letra maiúscula e um número.
 */

import crypto from "crypto";

function gerarSenha(length = 12, includeLower = true, includeSymbols = false) {
  if (length < 2) throw new Error("Tamanho mínimo é 2");

  const upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const digits = "0123456789";
  const lower = includeLower ? "abcdefghijklmnopqrstuvwxyz" : "";
  const symbols = includeSymbols ? "!@#$%&*()-_=+[]{}:;?<>/\\|~" : "";

  const pool = upper + digits + lower + symbols;
  if (!pool) throw new Error("Nenhum conjunto de caracteres habilitado");

  // Garante ao menos 1 maiúscula e 1 número
  const senhaChars = [
    upper.charAt(crypto.randomInt(0, upper.length)),
    digits.charAt(crypto.randomInt(0, digits.length))
  ];

  // Completa o restante
  for (let i = 2; i < length; i++) {
    senhaChars.push(pool.charAt(crypto.randomInt(0, pool.length)));
  }

  // Embaralha os caracteres
  for (let i = senhaChars.length - 1; i > 0; i--) {
    const j = crypto.randomInt(0, i + 1);
    [senhaChars[i], senhaChars[j]] = [senhaChars[j], senhaChars[i]];
  }

  return senhaChars.join("");
}

// Exemplo: gera 5 senhas
for (let i = 0; i < 5; i++) {
  console.log(gerarSenha(12, true, true));
}
ex