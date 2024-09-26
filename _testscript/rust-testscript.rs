// lib.rs

#[cfg(test)]
mod tests {
    #[test]
    fn test_addition() {
        assert_eq!(1 + 1, 2);
    }

    #[test]
    fn test_subtraction() {
        assert_eq!(5 - 3, 2);
    }

    #[test]
    fn test_multiplication() {
        assert_eq!(2 * 3, 6);
    }

    #[test]
    fn test_division() {
        assert_eq!(6 / 2, 3);
    }
}

// Run tests using: cargo test
