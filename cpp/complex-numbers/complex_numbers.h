#if !defined(COMPLEX_NUMBERS_H)
#define COMPLEX_NUMBERS_H

#include <cmath>

namespace complex_numbers {

template <typename T> class ComplexT {
public:
    ComplexT(T real, T imag) : m_real(real), m_imag(imag) {
    }

    [[nodiscard]] T real() const noexcept {
        return m_real;
    }

    [[nodiscard]] T imag() const noexcept {
        return m_imag;
    }

    [[nodiscard]] T abs() const noexcept {
        return std::sqrt(std::pow(this->real(), 2) + std::pow(this->imag(), 2));
    }

    [[nodiscard]] ComplexT<T> operator*(const ComplexT<T> &other) const noexcept {
        return ComplexT<T>((this->real() * other.real()) - (this->imag() * other.imag()),
                           (this->imag() * other.real()) + (this->real() * other.imag()));
    }

    [[nodiscard]] ComplexT<T> operator/(const ComplexT<T> denom) const noexcept {
        const auto new_denom = std::pow(denom.real(), 2) + std::pow(denom.imag(), 2);
        return ComplexT<T>(
            ((this->real() * denom.real()) + (this->imag() * denom.imag())) / new_denom,
            ((this->imag() * denom.real()) - (this->real() * denom.imag())) / new_denom);
    }

    [[nodiscard]] ComplexT<T> operator+(const ComplexT<T> &other) const noexcept {
        return ComplexT<T>(this->real() + other.real(), this->imag() + other.imag());
    }

    [[nodiscard]] ComplexT<T> operator-(const ComplexT<T> &other) const noexcept {
        return ComplexT<T>(this->real() - other.real(), this->imag() - other.imag());
    }

    [[nodiscard]] ComplexT<T> conj() const noexcept {
        return ComplexT<T>(this->real(), -this->imag());
    }

    [[nodiscard]] ComplexT<T> exp() const noexcept {
        const auto prefactor = std::exp(this->real());
        return ComplexT<T>(prefactor * std::cos(this->imag()), prefactor * std::sin(this->imag()));
    }

private:
    const T m_real;
    const T m_imag;
};

typedef ComplexT<double> Complex;

} // namespace complex_numbers

#endif // COMPLEX_NUMBERS_H
