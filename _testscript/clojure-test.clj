; test/your_project/core_test.clj

(ns your-project.core-test
  (:require [clojure.test :refer :all]
            [your-project.core :refer :all]))

(deftest a-test
  (testing "Basic arithmetic operations"
    (is (= 2 (+ 1 1)))
    (is (= 0 (- 1 1)))
    (is (= 6 (* 2 3)))
    (is (= 2 (/ 6 3)))))

; Run tests using: lein test
