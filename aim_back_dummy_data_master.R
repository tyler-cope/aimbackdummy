# =============================================================================
# CLEAN DATA PROCESSING TEMPLATE
# =============================================================================
# Author: Cope
# Date: 9/19/2025
# Details: AIM-Back dummy data for independent study 
# =============================================================================

# SETUP -----------------------------------------------------------------------
library(tidyverse)
library(janitor)
library(skimr)    
library(gtsummary)
library(gt)
library(flextable)

# Set paths (adjust as needed)
setwd("C:/Users/tlc74/OneDrive - Duke University/1) Tyler/PhD/Independent Study/Aim 3")

# STEP 1: READ DATA -----------------------------------------------------------
# Read the synthetic data
raw_data <- read.csv("aim_back_synthetic_data.csv")

# Basic data check
cat("Data loaded successfully!\n")
cat("Dimensions:", nrow(raw_data), "rows x", ncol(raw_data), "columns\n")

# Quick data overview
head(raw_data)
str(raw_data)

# Use skim for detailed summary
skim(raw_data)


# STEP 2: BASIC DATA EXPLORATION ---------------------------------------------
# Check key variables from your SAP
cat("\n=== KEY VARIABLES CHECK ===\n")

# Adherence variables
cat("PA session distribution:\n")
table(raw_data$PA_session_count, useNA = "ifany")

cat("\nPIPT session distribution (eligible patients):\n")
table(raw_data$PIPT_session_count[raw_data$SB_MedHigh == 1], useNA = "ifany")

# Outcome variables
cat("\nMissing outcome indicator:\n")
table(raw_data$missing_outcome, useNA = "ifany")

# Check baseline characteristics
cat("\nBaseline Pain Interference summary:\n")
summary(raw_data$BASE_use_paininterference)

cat("\nBaseline Physical Function summary:\n")
summary(raw_data$BASE_use_physicalfunction)


