# Duffinian Number Checker (MIPS Assembly)

This project implements a **Duffinian number checker** in **MIPS Assembly**.

A **Duffinian number** is a composite number that is relatively prime to the sum of its divisors. Formally, a number (n) is Duffinian if:

* (n) is composite;
* (\gcd(n, \sigma(n)) = 1),

where (\sigma(n)) is the sum of all positive divisors of (n).

## Algorithm

The program performs the following steps:

1. Reads an integer from memory.
2. Rejects numbers less than or equal to 1.
3. Computes the prime factorization of the input.
4. Calculates the divisor sum function (\sigma(n)) using the prime factorization:
   [
   \sigma(n) = \prod_{i=1}^{k} \left(1 + p_i + p_i^2 + \cdots + p_i^{a_i}\right)
   ]
5. Computes the greatest common divisor (GCD) between the input number and (\sigma(n)) using Euclid's algorithm.
6. Determines whether the number is Duffinian.

## Return Values

The result is stored in register `$v0`:

* `1` → The number is Duffinian.
* `0` → The number is not Duffinian.
* `-1` → Arithmetic overflow occurred during the computation.

## Features

* Written entirely in **MIPS Assembly**.
* Prime factorization-based computation of the divisor sum.
* Euclidean algorithm for GCD calculation.
* Overflow detection for integer additions and multiplications.
* Handles prime numbers and invalid inputs correctly.

## Example

```assembly
.data
numero: .word 1126
```

For the input above, the program determines whether **1126** is a Duffinian number and stores the result in `$v0`.
