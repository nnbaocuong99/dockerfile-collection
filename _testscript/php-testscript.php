<?php
// TestScript.php

use PHPUnit\Framework\TestCase;

class TestScript extends TestCase
{
    public function testAddition()
    {
        $this->assertEquals(2, 1 + 1);
    }

    public function testSubtraction()
    {
        $this->assertEquals(2, 5 - 3);
    }

    public function testMultiplication()
    {
        $this->assertEquals(6, 2 * 3);
    }

    public function testDivision()
    {
        $this->assertEquals(3, 6 / 2);
    }
}

// Run tests using PHPUnit: ./vendor/bin/phpunit TestScript.php
// Make sure to install PHPUnit: composer require --dev phpunit/phpunit
