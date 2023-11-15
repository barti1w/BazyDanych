CREATE OR REPLACE FUNCTION nameJob (id IN VARCHAR2) RETURN VARCHAR2 IS
    nameReturned VARCHAR2(35);
BEGIN
SELECT JOB_TITLE INTO nameReturned FROM JOBS WHERE JOB_ID = id;
RETURN nameReturned;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.PUT_LINE('Praca o podanym id nie istnieje');
RETURN NULL;
END;

BEGIN
    dbms_output.PUT_LINE(nameJob('AD_PRES'));
end;



CREATE OR REPLACE FUNCTION salaryId (id IN NUMBER) RETURN NUMBER IS
salaryReturned NUMBER(8,2);
bonus NUMBER(8,2);
BEGIN
SELECT SALARY, COMMISSION_PCT INTO salaryReturned, bonus FROM EMPLOYEES WHERE EMPLOYEE_ID = id;
if bonus IS NULL THEN
        bonus := 0;
end if;
    bonus := salaryReturned * bonus;
    salaryReturned := salaryReturned*12 + bonus;
return salaryReturned;
END;

BEGIN
    dbms_output.PUT_LINE(salaryId(148));
end;


CREATE OR REPLACE FUNCTION kierunkowy (wholeNumber IN VARCHAR2) RETURN VARCHAR2 IS
    numer VARCHAR2(40);
    kierunek VARCHAR2(40);
BEGIN
    numer := substr(wholeNumber, -9);
    kierunek := substr(wholeNumber, 0, length(wholeNumber) - 9);
    numer := '(' || kierunek || ')' || numer;
return numer;
END;

BEGIN
    dbms_output.PUT_LINE(kierunkowy('012345678911'));
end;


CREATE OR REPLACE FUNCTION smallBig (tekst IN VARCHAR2) RETURN VARCHAR2 IS
returnText VARCHAR2(40);
BEGIN
    returnText := INITCAP(tekst);
    returnText := substr(returnText, 0, length(returnText) - 1) || INITCAP(substr(returnText, -1));
return returnText;
END;

BEGIN
    dbms_output.PUT_LINE(smallBig('akacjab'));
end;


CREATE OR REPLACE FUNCTION birthPesel (pesel IN VARCHAR2) RETURN VARCHAR2 IS
    year_part VARCHAR2(20);
    month_part VARCHAR2(20);
    day_part VARCHAR2(20);
    whatDecade NUMBER;
    r NUMBER;
BEGIN
    year_part := SUBSTR(pesel, 1, 2);
    month_part := SUBSTR(pesel, 3, 2);
    day_part := SUBSTR(pesel, 5, 2);
    whatDecade := TO_NUMBER(SUBSTR(month_part, 0, 1));
    r := MOD(TO_NUMBER(SUBSTR(month_part, 0, 1)), 2);
    IF r = 0 THEN
        dbms_output.PUT_LINE('');
ELSE
        whatDecade := whatDecade - 1;
END IF;
    whatDecade := CEIL(whatDecade) * 10;
    month_part := TO_CHAR(TO_NUMBER(month_part) - whatDecade);

    IF whatDecade = 80 THEN
        whatDecade := 18;
    ELSIF whatDecade = 00 THEN
        whatDecade := 19;
    ELSIF whatDecade = 20 THEN
        whatDecade := 20;
    ELSIF whatDecade = 40 THEN
        whatDecade := 21;
ELSE
        whatDecade := 22;
END IF;

    year_part := TO_CHAR(whatDecade) || year_part;
return year_part || '-' || month_part || '-' || day_part;
end;

BEGIN
    dbms_output.PUT_LINE(birthPesel('10122805796'));
end;

CREATE OR REPLACE FUNCTION numberEmployee (country IN VARCHAR2) RETURN NUMBER IS
    employees NUMBER;
BEGIN
SELECT COUNT(*) INTO employees FROM COUNTRIES
                                        inner join LOCATIONS L on COUNTRIES.COUNTRY_ID = L.COUNTRY_ID
                                        inner join DEPARTMENTS D on L.LOCATION_ID = D.LOCATION_ID
                                        inner join EMPLOYEES E on D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE COUNTRY_NAME = country;
return employees;
END;

BEGIN
    dbms_output.PUT_LINE(numberEmployee('Canada'));
end;


CREATE OR REPLACE FUNCTION numberDepartment (country IN VARCHAR2) RETURN NUMBER IS
    departments NUMBER;
BEGIN
SELECT COUNT(*) INTO departments FROM COUNTRIES
                                          inner join LOCATIONS L on COUNTRIES.COUNTRY_ID = L.COUNTRY_ID
                                          inner join DEPARTMENTS D on L.LOCATION_ID = D.LOCATION_ID
WHERE COUNTRY_NAME = country;
return departments;
END;

BEGIN
    dbms_output.PUT_LINE(numberDepartment('Canada'));
end;
