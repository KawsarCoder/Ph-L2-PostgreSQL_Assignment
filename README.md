# Questionnaire

## What is PostgreSQL?

PostgreSQL হলো ওপেন সোর্স রিলেশনাল ডাটাবেস ম্য়ানেজমেন্ট সিস্টেম। এটি দিয়ে আমরা কোনো একটা ডাটাবেস তৈরি করতে পারি, ডিলেট করতে পারি, সংরক্ষণ করতে পারি, টেবিল আকারে সাজাতে পারি, প্রয়োজন অনুসারে আপডেট করতে পারি। এটির মাধ্যমে বিভিন্ন ধরনের কুয়েরি ও ডাটা ইন্ট্রিগেশন করা যায়। এটির মাধ্য়মে বিভিন্ন ধরনের ডাটা টাইপ এডড করা যায়। এটি বর্তমানে খুব জনপ্রিয় একটি ডাটাবেস সিস্টেম।

## What is the purpose of a database schema in PostgreSQL?

PostgreSQL এর মধ্যে ডাটাবেস স্কিমার উদ্দেশ্য হলো ডাটাবেসের ভিতরের ডাটা আর অবজেক্টগুলো সুন্দরভাবে সাজিয়ে গুছিয়ে রাখা। এখানে টেবিল, ফাংশন ইত্যাদি রাখা হয়। এর মাধ্যমে ডাটাবেসকে ম্যানেজমেন্ট সহজ হয় এবং আরো বেশি কার্যকর করে তোলে। যার মাধ্যমে নিরাপদ আর নিয়ন্ত্রণ করা সহজ হয়।

## Explain the Primary Key and Foreign Key concepts in PostgreSQL.

-- Primary Key:
Primary Key মূলত একটি Unique Key এটি একটি কলাম বা ফিল্ডকে আলাদাভাবে চিনতে সাহায্য করে। এটি কখনো নাল হয় না। একটি টেবিলে শুধুমাত্র একটা Primary Key থাকে।

উদাহরণ:
একটি টেবিলে student_id যদি Primary Key হয়, তাহলে প্রতিটা শিক্ষার্থীর আইডি ইউনিক হবে।

-- Foreign Key:
Foreign Key মূলত অন্য একটা টেবিলের Primary Key। এর মাধ্যমে দুটি টেবিলের মধ্যে রিলেশন তৈরি করা হয়।

উদাহরণ:
student_id যদি enrollments টেবিলে Foreign Key হয়, তাহলে সেটি students টেবিলের student_id কে রেফার করে।

## What is the difference between the VARCHAR and CHAR data types?

VARCHAR:

- এটির দৈর্ঘ্যের পরিবর্তন করা যায়
- যদি VARCHAR(10) দেয়া হয় আর যদি সেখানে ৭ অক্ষরের ডাটা রাখা হয় তাহলে এটি শুধু ৭ অক্ষর ধারণ করবে। অতিরিক্ত স্পেস নিবে না।
- এটি মূলত যে ডাটা গুলোর দৈর্ঘ্য ফিক্সড না সেক্ষেত্রে ব্যবহার করা হয়।

CHAR:

- এটার দৈর্ঘ্য় ফিক্সড হয়ে থাকে।
- যদি CHAR(10) দেয়া হয় আর যদি সেখানে ৭ অক্ষরের ডাটা রাখা হয় তাহলে এটি ৭ অক্ষর সহ বাকি ৩ অক্ষরের ডাটাও ধারণ করবে। যার ফলে অতিরিক্ত স্পেস নিয়ে থাকে।
- এটা যে ডাটা গুলোর দৈর্য্য সবসময় ফিক্সড থাকে সেগুলোর জন্য ব্যবহার করা ভালো।

## How can you modify data using UPDATE statements?

PostgreSQL এ কোনো একটা টেবিলে থাকা ডাটা আপডেট করতে UPDATE স্টেটমেন্ট ব্যবহার করা হয়। যেমন:

```
UPDATE table_name
SET column1 = value1, column2 = value2,...
WHERE condition.
```

উদাহরণ:
ধরি students নামের একটা টেবিল আছে। যেখানে name এবং age নামের কলাম আছে। তাহলে আমরা নিচের নিয়মে আপডেট করতে পারি:

```
UPDATE students
SET age = 25
WHERE name = 'Kawsar'
```
