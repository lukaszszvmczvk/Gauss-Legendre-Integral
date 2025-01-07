# 📐 Gauss-Legendre Integral

This project calculates the value of a **double integral** over the domain:  
\[
D = \{(x, y) \in \mathbb{R}^2 : |x| + |y| \leq 1\}
\]  
by transforming it to the square \([-1, 1] \times [-1, 1]\) and applying **composite 3-point Gauss-Legendre quadrature**.

The main function, **`P2Z07_LSZ_integral.m`**, implements this method to achieve efficient and accurate numerical integration.

---

## 🧪 Tests
- **`test*.m`**: Validate the correctness of the integral computation.
- **`test_num_*.m`**: Analyze the numerical properties, such as convergence and precision.

---

## 📄 Documentation
The project includes a detailed **report in Polish** (`P2Z07_LSZ.pdf`), covering the theoretical background, implementation details, and analysis of the results.
