# Duffinian Number Checker (MIPS Assembly)

This project implements a **Duffinian number checker** in **MIPS Assembly**.

A **Duffinian number** is a composite number that is relatively prime to the sum of its divisors. In other words, a number `n` is Duffinian if:

* `n` is composite;
* `gcd(n, sigma(n)) = 1`;

where `sigma(n)` is the sum of all positive divisors of `n`.

## Algorithm

The program performs the following steps:

1. Reads an integer from memory.

2. Rejects numbers less than or equal to 1.

3. Computes the prime factorization of the input.

4. Computes the divisor sum `sigma(n)` using the formula:

   ```
   sigma(n) = (1 + p1 + p1^2 + ... + p1^a1)
            * (1 + p2 + p2^2 + ... + p2^a2)
            * ...
            * (1 + pk + pk^2 + ... + pk^ak)
   ```

   where `pi` are the prime factors and `ai` are their exponents.

5. Computes `gcd(n, sigma(n))` using Euclid's algorithm.

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
* Correct handling of prime numbers and invalid inputs.

## Example

```assembly
.data
numero: .word 1126
```



For the input above, the program determines whether **1126** is a Duffinian number and stores the result in `$v0`.

## N.B.
The code ends with an infinite loop because the professor wanted it like this, if you prefer you can use a syscall.
