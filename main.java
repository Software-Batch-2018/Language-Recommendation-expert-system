package com.company;

import java.util.Scanner;
public class Main {
    /** Main method */
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        int lowestScore = 0; 			// Holds the hightest student score
        String lowestScoreName = ""; // Holds the student name with highest score
        Student[] arr;

        // Prompt the user to enter the number of students
        System.out.print("Enter the number of students: ");
        int numberOfStudents = input.nextInt();

        // Prompt the user to enter each student's name and score
        System.out.println("Enter each student’s name and score");
        for (int i = 0; i < numberOfStudents; i++) {
            System.out.print(
                    "Student: " + (i + 1) +
                            "\n   Name: ");
            String name = input.next();
            System.out.print(
                    "   Score: ");
            int score = input.nextInt();
            arr[i] = new Student(name, score);
            // Test if score is higher than highest score

        }

        arr.display();

        // Display the name of the student with the highest score
        System.out.println("Student with the lowest score: " + lowestScoreName);
    }
}


public class Student {
    String name;
    int score;

    public Student(String name , int score){
        this.name = name;
        this.score = score;
    };

    public void display()
    {
        System.out.println("Student name is: " + name + " "
                           + "and Student score is: "
                           + score);
        System.out.println();
    }
}